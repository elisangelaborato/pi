import 'package:flutter/material.dart';
import 'package:pi/view/tab_agenda_prestador.dart';
import 'package:pi/view/tab_avaliacao_prestador.dart';
import 'package:pi/view/tab_perfil_prestador.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

////80% of screen width
//double c_width = MediaQuery.of(context).size.width*0.8;

class TelaPerfilPrestador extends StatefulWidget {

  final Map<String, dynamic> pessoa;
  final int cdgPessoa;

  TelaPerfilPrestador({this.pessoa, this.cdgPessoa});

  @override
  _TelaPerfilPrestadorState createState() => _TelaPerfilPrestadorState(pessoa: pessoa, cdgPessoa: cdgPessoa);
}

class _TelaPerfilPrestadorState extends State<TelaPerfilPrestador> {

  Map<String, dynamic> pessoa;
  final int cdgPessoa;

  _TelaPerfilPrestadorState({this.pessoa, this.cdgPessoa});


//  Future<Map> _getPessoa(int cdgPessoa) async{
//    _getDados()
//        .then( (pessoas) {
//          pessoa = pessoas[1];
//          print(pessoas);
//          print(pessoa);
//
//          pessoas.forEach(
//            (k,v) {
//              //if (k == "cdgPessoa" && v == cdgPessoa){
//              print('${k}: ${v}');
//              //}
//              v.replaceAll('[', '');
//              v.replaceAll(']', '');
//              v.forEach(
//                  (y, j){
//                    print('${y}: ${j}');
//                  }
//              );
//          }
//        );
//    }
//    );
//  }

//  Widget setPessoa(){
//    return FutureBuilder(
//        future: _getDados(),
//        builder: (context, snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.none:
//            case ConnectionState.waiting:
//              return Container(
//                width: 200.0,
//                height: 200.0,
//                alignment: Alignment.center,
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
//                  strokeWidth: 10.0,
//                ),
//              );
//            default:
//              if (snapshot.hasError) {
//                return Container(
//                  color: Colors.redAccent,
//                );
//              } else {
//                print("XXXXXXX ${snapshot.data}");
//                pessoa = snapshot.data["pessoa"][0];
//                print(pessoa);
//                return Container(color: Colors.pinkAccent, height: 50, width: double.infinity,);
//                //return _createListView(context, snapshot);
//              }
//          }
//    });
//  }


  Future<Map> _getDados(String cdgPessoa) async {
    http.Response response;
//    response = await http.get(
//        "http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa");
    //http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa
    //http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa&codigo=1&idTabela=cdgPessoa
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa&codigo=$cdgPessoa&idTabela=cdgPessoa");
    print("_getDados response.body: ${response.body}");
    return json.decode(response.body);
  }


  Future<Map> _getPessoa(String cdgPessoa) async{
    _getDados(cdgPessoa)
        .then( (p) {
      print("$p");
          //{pessoa: [{cdgPessoa: 1, nome: Anderson, email: anderson_megax@hotmail.com, senha: senha123, cpfcnpj: 123123123, imagem: null}]}
          pessoa = p;
      print("ola");
          print("${p["pessoa"][0]["nome"]}");
          print("${p["pessoa"][0]["email"]}");
//          print("${p["pessoa"]["senha"]}");
//          print("${p["pessoa"]["cpfcnpj"]}");
//          print("${p["pessoa"]["imagem"]}");

//          pessoa = pessoas[1];
//          print(pessoas);
//          print(pessoa);
//
//          pessoas.forEach(
//            (k,v) {
//              //if (k == "cdgPessoa" && v == cdgPessoa){
//              print('${k}: ${v}');
//              //}
//              v.replaceAll('[', '');
//              v.replaceAll(']', '');
//              v.forEach(
//                  (y, j){
//                    print('${y}: ${j}');
//                  }
//              );
//          }
//        );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    _getPessoa("1");
    if (pessoa == null) {
      //buscar dados pessoa pelo codigo via api
      _getPessoa("1");
    }

//    setPessoa();
  //ToDo: testar colocar o FutureBuilder abaixo e o conteudo abaixo dentro do FutureBuilder

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
                  "NOME DA PESSOA",//pessoa["nome"] ?? "NOME DA PESSOA",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Prestador Silver",
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
