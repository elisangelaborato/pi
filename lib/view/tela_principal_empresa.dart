import 'package:flutter/material.dart';

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
                  text: "Serviços",
                ),
                Tab(
                  text: "Prestadores",
                ),
                Tab(
                  text: "Meus Serviços",
                ),
              ],
            ),
            title: Text('Nome da Empresa'),
            centerTitle: true,
          ),
          drawer: Drawer(),
          body: TabBarView(
            children: [
              Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
              //ServicosWidget(),
              //PrestadoresWidget(),
              //MeusServicosWidget(),
            ],
          ),
        ),
      ),
    );;
  }
}
