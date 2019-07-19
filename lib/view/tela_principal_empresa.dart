import 'package:flutter/material.dart';
import 'package:pi/futurebuilder/futurebuilder_lista_agendamentos.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/tela_lista_avaliacoes.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pi/view/drawer.dart';

class TelaPrincipalEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
//      MaterialApp(
//      home:
        DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: GradientAppBar(
          gradient: LinearGradient(colors: [
            Color(0xFF000033),
            Color(0xFF000066),
            Color(0xFF000080),
            Color(0xFF0000b3),
            Color(0xFF0000e6),
            Color(0xFF0000ff),
          ]),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Abertos",
              ),
              Tab(
                text: "Prestados",
              ),
              Tab(
                text: "Avaliações",
              ),
            ],
          ),
          title: Text('Alguz Serviços A à Z'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        drawer: CustomDrawer(), //DrawerPrestador(),
        body: TabBarView(
          children: [
            ServicosAbertos(),
            ServicosPrestados(),
            Avaliacoes(),
          ],
        ),
      ),
//      ),
    );
  }
}

class ServicosAbertos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilderListaAgendamentos(
      cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa,
      situacaoAgendamento: "AGENDADO",
    );
  }
}

class ServicosPrestados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilderListaAgendamentos(
      cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa,
      situacaoAgendamento: "EXECUTADO",
    );
  }
}

class Avaliacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("onTap grafico");
              //ve historico do prestador logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAvaliacoes(
                          cdgPessoa_prestador:
                          PessoaModel.of(context).cdgPessoa)));
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: PieChart(
                dataMap: RetornaMapDados(), //Required parameter
                legendFontColor: Colors.blueGrey[900],
                legendFontSize: 14.0,
                legendFontWeight: FontWeight.w500,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 2.7,
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: true,
                chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                //colorList: colorList, lista de cores do exempo, nao ta funcionando
                showLegends: true,
              ),
            ),
          ),
          Container(
            child: Grafico(),
          )
        ],
      ),
    );
  }
}

Map RetornaMapDados() {
  Map<String, double> dataMap = Map();
  dataMap.putIfAbsent("Janeiro", () => 5);
  dataMap.putIfAbsent("Fevereiro", () => 3);
  dataMap.putIfAbsent("Março", () => 2);
  dataMap.putIfAbsent("Abril", () => 2);
  return dataMap;
}

class Grafico extends StatefulWidget {
  @override
  _GraficoState createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  final fromDate = DateTime(2019, 05, 28);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.47,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          fromDate: fromDate,
          bezierChartScale: BezierChartScale.WEEKLY,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Serviços",
              onMissingValue: (dateTime) {
                if (dateTime.day.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundColor: Colors.red,
            footerHeight: 30.0,
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final profissoes = ["Beleza", "Saúde", "Professores"];

  final pesquisarecente = ["Saúde"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //retornar a lista da profissão pesquisada
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? pesquisarecente
        : profissoes.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
            leading: Icon(Icons.work),
            title: RichText(text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )]
            )),
          ),
      itemCount: suggestionList.length,
    );
  }
}
