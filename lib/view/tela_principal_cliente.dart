import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';
import 'package:pi/view/tela_agendamento_cliente.dart';
import 'package:http/http.dart' as http;
import 'package:pi/view/tela_perfil_prestador.dart';

class TelaPrincipalCliente extends StatefulWidget {
  @override
  _TelaPrincipalClienteState createState() => _TelaPrincipalClienteState();
}

class _TelaPrincipalClienteState extends State<TelaPrincipalCliente> {
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
                  text: "Contratados",
                ),
              ],
            ),
            title: Text('Alguz Serviços A à Z'),
            centerTitle: true,
            actions: <Widget>[
              Icon(Icons.search),
            ],
          ),
          drawer: CustomDrawer(),
          body: TabBarView(
            children: [
              ServicosWidget(),
              PrestadoresWidget(),
              MeusServicosWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicosWidget extends StatelessWidget {

  Future<Map> _getDados() async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=categoriaservico");
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    int icone = 58355;

    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: _getDados(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                        strokeWidth: 10.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container(
                        color: Colors.redAccent,
                      );
                    } else {
                      //return Container(color: Colors.pinkAccent, height: 50, width: double.infinity,);
                      return _createListView(context, snapshot);
                    }
                }
              }),
        ),
      ],
    );
  }

  Widget _createListView(context, snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["categoriaservico"].length,
      itemBuilder: (context, index) {
        print(snapshot.data["categoriaservico"].length);
        print(index);
        return _createTile(context, snapshot, index);
      },
    );
  }

  Widget _createTile(context, snapshot, index) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "http://pontoemcomumseguros.com.br/images/icones/lifeline-in-a-heart-outline.png"),
                Icon(
              IconData(
                  int.parse(snapshot.data["categoriaservico"][index]["icone"]),
                  fontFamily: 'MaterialIcons'), //Icons.healing,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text(snapshot.data["categoriaservico"][index]["descricao"]),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
      ],
    );
  }
}

class MeusServicosWidget extends StatelessWidget {
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
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaAgendamentoCliente()),
                  );*/

                  //nao sei pq issa rota nao funciona
                 //Navigator.of(context).pushNamed('/telaAgendamentoCliente');
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaAgendamentoCliente()),
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
                    MaterialPageRoute(
                        builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget getCard(context) {
    return Card(
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
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Theme.of(context).primaryColor,
                      ),
//                      Image.network(
//                          "https://image.flaticon.com/icons/png/512/10/10003.png"),
                      radius: 20,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      "Cliente",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Maycon",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
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
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "14/08 - 13:30",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
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
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
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
                      RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "CANCELAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class PrestadoresWidget extends StatelessWidget {
  Future<Map> _getDados() async {
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa");
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: _getDados(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                        strokeWidth: 10.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container(
                        color: Colors.redAccent,
                      );
                    } else {
                      //return Container(color: Colors.pinkAccent, height: 50, width: double.infinity,);
                      return _createCadList(context, snapshot);
                    }
                }
              }),
        ),
      ],
    );
  }

  Widget _createCadList(context, snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["pessoa"].length,
      itemBuilder: (context, index) {
        print(snapshot.data["pessoa"].length);
        print(index);
        return getCard(context, snapshot, index);
      },
    );
  }

  Widget getCard(context, snapshot, index) {
    return Card(
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 80.0,
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
                      child:
                          //se imagem nula ou em branco, coloca icone padrao
                          (snapshot.data["pessoa"][index]["imagem"] == null ||
                                  snapshot.data["pessoa"][index]["imagem"]
                                          .length ==
                                      0)
                              ? Icon(
                                  Icons.account_circle,
                                  size: 60,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Image.network(
                                  snapshot.data["pessoa"][index]["imagem"]),
//                          //Icon(Icons.person, size: 60, color: Theme.of(context).primaryColor,),
//                          Image.network(
//                              "http://images.coveralia.com/autores/thumbs/belchior81574m.jpg"),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
//                    Text(
//                      "Cliente",
//                      style: TextStyle(fontSize: 16,),
//                    ),
//                    Text(
//                      "Maycon",
//                      style: TextStyle(color: Colors.grey, fontSize: 12,),
//                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data["pessoa"][index]["nome"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
//                      Text(
//                        "14/08 - 13:30",
//                        style: TextStyle(color: Colors.grey, fontSize: 12,),
//                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        (snapshot.data["pessoa"][index]["email"].length <= 15)
                            ? snapshot.data["pessoa"][index]["email"]
                            : '${snapshot.data["pessoa"][index]["email"].substring(0, 15)}...', //"Pedreiro",
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "100.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
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
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "VER PERFIL",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaPerfilPrestador(pessoa: snapshot.data["pessoa"][index])),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
