import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pi/view/tab_agenda_cliente.dart';
import 'package:pi/view/tab_avaliacao_cliente.dart';
import 'package:pi/view/tab_perfil_cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pi/model/pessoa_model.dart';

////80% of screen width
//double c_width = MediaQuery.of(context).size.width*0.8;

class TelaPerfilCliente extends StatefulWidget {

  final Map<String, dynamic> pessoa;
  final int cdgPessoa;

  TelaPerfilCliente({this.pessoa, this.cdgPessoa});

  @override
  _TelaPerfilClienteState createState() => _TelaPerfilClienteState();
}

class _TelaPerfilClienteState extends State<TelaPerfilCliente> {

  final Map<String, dynamic> pessoa;
  final int cdgPessoa;

  _TelaPerfilClienteState({this.pessoa, this.cdgPessoa});

/*  Future<Map> _getDados() async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa");
    print(response.body);
    return json.decode(response.body);
  }*/

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      body: getTop(),
//    );

    return DefaultTabController(
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
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Center(
              child: getTop(),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.square(180.0),
            child: getTabBar(),
          ),
        ),
        body: getTabBarPages(),
      ),
    );
  }

  Widget getTabBar() {
    return TabBar(//controller: tabController,
        tabs: [
      Tab(text: "Perfil", ), //icon: Icon(Icons.perm_contact_calendar)
      Tab(text: "Agenda", ), //icon: Icon(Icons.calendar_today)
      Tab(text: "Avaliações", ), //icon: Icon(Icons.star)
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(//controller: tabController,
        children: <Widget>[
          TabPerfilCliente(),
          TabAgendaCliente(),
          TabAvaliacaoCliente(),
    ]);
  }

  Widget getTop() {
    return Stack(
      children: <Widget>[
//        Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(top: 16.0),
//            ),
//            Row(
//              children: <Widget>[
//                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
//              ],
//            ),
//          ],
//        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('images/person.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  PessoaModel.of(context).nome,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cliente Platinum",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                 PessoaModel.of(context).notaCliente,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
