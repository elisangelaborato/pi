import 'package:flutter/material.dart';
import 'package:pi/view/drawer_prestador.dart';
import 'package:pi/view/tela_agendamento_prestador.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
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
              Icon(Icons.search),
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
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  print("GestureDetector, onTap acionado");
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

//    return Padding(
//      padding: const EdgeInsets.only(top: 10),
//      child: Row(
//        children: <Widget>[
//
//          Column(
//            //crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              CircleAvatar(
//                child: Image.network(
//                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
//                radius: 35,
//                backgroundColor: Colors.transparent,
//              ),
//              Text("Cliente", style: TextStyle(fontSize: 20),),
//              Text("Maycon", style: TextStyle(color: Colors.grey),),
//            ],
//          ),
//
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//                Text("Data/Hora", style: TextStyle(fontSize: 20),),
//                Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
//                Divider(
//                  height: 30,
//                ),
//                Text("Valor", style: TextStyle(fontSize: 20),),
//                Text("R\$80,00", style: TextStyle(color: Colors.grey),),
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//                Divider(
//                  height: 60,
//                ),
//                RaisedButton(
//                  onPressed: (){},
//                  child: Text("Cancelar"),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
  }

  Widget getCard(context) {
    return Card(
      elevation: 15.0,
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 100.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.person, size: 35, color: Theme.of(context).primaryColor,),
//                      Image.network(
//                          "https://image.flaticon.com/icons/png/512/10/10003.png"),
                      radius: 20,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      "Cliente",
                      style: TextStyle(fontSize: 16,),
                    ),
                    Text(
                      "Maycon",
                      style: TextStyle(color: Colors.grey, fontSize: 12,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Data/Hora",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),
                      ),
                      Text(
                        "14/08 - 13:30",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "Valor",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "R\$80,00",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Divider(
                        height: 0,
                      ),
                      GradientButton(gradient: LinearGradient(
                        colors: [
                          const Color(0xFFe60000),
                          const Color(0xFFe60000),
                          const Color(0xFFff4d4d),
                          const Color(0xFFe60000),
                          const Color(0xFFff1a1a),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                        child: Text("CANCELAR", style: TextStyle(fontSize: 15.0),),
                        callback: () {

                        },
                        increaseWidthBy: 35.0,
                      ),
                      
//                      RaisedButton(
//                        onPressed: () {},
//                        color: Theme.of(context).primaryColor,
//                        child: Text("CANCELAR", style: TextStyle(color: Colors.white),),
//                      ),

                    ],
                  ),
                ),
              ],
            ),

//            child: Row(
//              children: <Widget>[
////                CircleAvatar(
////                  radius: 30.0,
////                  backgroundColor: Colors.transparent,
////                  backgroundImage: ExactAssetImage('images/person.png'),
////                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 8, left: 8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        "01/01/2020 - Cliente Fulano de Tal",
//                        style: Theme.of(context).textTheme.caption,
//                      ),
//                      Container(
//                        width: MediaQuery.of(context).size.width * 0.85,
//                        height: 30.0,
//                        child: Text(
//                          "Mussum Ipsum, cacilds vidis litro abertis. A ordem dos tratores não altera o pão duris. Detraxit consequat et quo num tendi nada. Manduma pindureta quium dia nois paga. Suco de cevadiss deixa as pessoas mais interessantis.",
//                          style: TextStyle(fontSize: 12.0),
//                          overflow: TextOverflow.ellipsis,
//                          maxLines: 2,
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 4.0),
//                      ),
//                      Text(
//                        "100.0",
//                        style: TextStyle(
//                            fontSize: 12.0, fontWeight: FontWeight.bold),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
          )),
    );
  }
}

class ServicosPrestados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  print("GestureDetector, onTap acionado");
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

//    return Padding(
//      padding: const EdgeInsets.only(top: 10),
//      child: Row(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              CircleAvatar(
//                child: Image.network(
//                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
//                radius: 35,
//                backgroundColor: Colors.transparent,
//              ),
//              Text(
//                "Cliente",
//                style: TextStyle(fontSize: 20),
//              ),
//              Text(
//                "Maycon",
//                style: TextStyle(color: Colors.grey),
//              ),
//            ],
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//                Text(
//                  "Data/Hora",
//                  style: TextStyle(fontSize: 20),
//                ),
//                Text(
//                  "14/08 - 13:30",
//                  style: TextStyle(color: Colors.grey),
//                ),
//                Divider(
//                  height: 30,
//                ),
//                Text(
//                  "Valor",
//                  style: TextStyle(fontSize: 20),
//                ),
//                Text(
//                  "R\$80,00",
//                  style: TextStyle(color: Colors.grey),
//                ),
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//                Divider(
//                  height: 60,
//                ),
//                RaisedButton(
//                  onPressed: () {},
//                  child: Text("Cancelar"),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
  }

  Widget getCard(context) {
    return Card(
      elevation: 15.0,
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 100.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.person, size: 35, color: Theme.of(context).primaryColor,),
//                      Image.network(
//                          "https://image.flaticon.com/icons/png/512/10/10003.png"),
                      radius: 20,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      "Cliente",
                      style: TextStyle(fontSize: 16,),
                    ),
                    Text(
                      "Maycon",
                      style: TextStyle(color: Colors.grey, fontSize: 12,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Data/Hora",
                        style: TextStyle(fontSize: 16,),
                      ),
                      Text(
                        "14/08 - 13:30",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "Valor",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "R\$80,00",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Divider(
                        height: 0,
                      ),
                      GradientButton(gradient: LinearGradient(
                        colors: [
                          const Color(0xFFe60000),
                          const Color(0xFFe60000),
                          const Color(0xFFff4d4d),
                          const Color(0xFFe60000),
                          const Color(0xFFff1a1a),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                        child: Text("EXCLUIR", style: TextStyle(fontSize: 15.0),),
                        callback: () {

                        },
                        increaseWidthBy: 22.0,
                      ),
//                      RaisedButton(
//                        onPressed: () {},
//                        color: Colors.redAccent,
//                        child: Text("EXCLUIR", style: TextStyle(color: Colors.white),),
//                      ),
                    ],
                  ),
                ),
              ],
            ),

          )),
    );
  }

}

class Avaliacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
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
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
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
