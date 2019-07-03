import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:bezier_chart/bezier_chart.dart';

class TelaPrincipalEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Serv. Abertos",
                ),
                Tab(
                  text: "Serv. Prestados",
                ),
                Tab(
                  text: "Avaliações",
                ),
              ],
            ),
            title: Text('Nome da Empresa'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(),
          body:
          TabBarView(
            children: [
              ServicosAbertos(),
              ServicosPrestados(),
              Avaliacoes(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicosAbertos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
                radius: 35,
                backgroundColor: Colors.transparent,
              ),
              Text("Cliente", style: TextStyle(fontSize: 20),),
              Text("Maycon", style: TextStyle(color: Colors.grey),),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: <Widget>[
                Text("Data/Hora", style: TextStyle(fontSize: 20),),
                Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
                Divider(
                  height: 30,
                ),
                Text("Valor", style: TextStyle(fontSize: 20),),
                Text("R\$80,00", style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: <Widget>[
                Divider(
                  height: 60,
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text("Cancelar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicosPrestados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
                radius: 35,
                backgroundColor: Colors.transparent,
              ),
              Text("Cliente", style: TextStyle(fontSize: 20),),
              Text("Maycon", style: TextStyle(color: Colors.grey),),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: <Widget>[
                Text("Data/Hora", style: TextStyle(fontSize: 20),),
                Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
                Divider(
                  height: 30,
                ),
                Text("Valor", style: TextStyle(fontSize: 20),),
                Text("R\$80,00", style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              children: <Widget>[
                Divider(
                  height: 60,
                ),
                RaisedButton(
                  onPressed: (){},
                  child: Text("Cancelar"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avaliacoes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: PieChart(
            dataMap: RetornaMapDados(), //Required parameter
            legendFontColor: Colors.blueGrey[900],
            legendFontSize: 14.0,
            legendFontWeight: FontWeight.w500,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery
                .of(context)
                .size
                .width / 2.7,
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
    );
  }
}

Map RetornaMapDados(){
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



