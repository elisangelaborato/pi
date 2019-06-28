import 'package:flutter/material.dart';
import 'package:pi/view/tab_agenda_prestador.dart';
import 'package:pi/view/tab_avaliacao_prestador.dart';
import 'package:pi/view/tab_perfil_prestador.dart';

////80% of screen width
//double c_width = MediaQuery.of(context).size.width*0.8;

class TelaPerfilPrestador extends StatefulWidget {
  @override
  _TelaPerfilPrestadorState createState() => _TelaPerfilPrestadorState();
}

class _TelaPerfilPrestadorState extends State<TelaPerfilPrestador> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      body: getTop(),
//    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
          TabPerfilPrestador(),
          TabAgendaPrestador(),
          TabAvaliacaoPrestador(),
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
                  "NOME DA PESSOA",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Prestador Gold",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "100.0",
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
