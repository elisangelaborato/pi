import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/card/card_prestador.dart';
import 'package:pi/view/drawer.dart';
import 'package:pi/view/tela_agendamento_cliente.dart';
import 'package:http/http.dart' as http;
import 'package:pi/view/tela_lista_prestadores.dart';
import 'package:pi/view/tela_perfil_prestador.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pi/model/servicos_model.dart';

class TelaPrincipalCliente extends StatefulWidget {
  @override
  _TelaPrincipalClienteState createState() => _TelaPrincipalClienteState();
}

class _TelaPrincipalClienteState extends State<TelaPrincipalCliente> {


  @override
  Widget build(BuildContext context) {
    return
//      ScopedModelDescendant<ServicosModel>(
//        builder: (context, child, model)=>
//      MaterialApp(
//      home:
      DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: GradientAppBar(
            elevation: 15,
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
//      ),
//      ),
    );
  }
}

class ServicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int icone = 58355;
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: ServicosModel.of(context).getTiposServicos(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
//                      decoration: BoxDecoration(
//                        boxShadow: [
//                          new BoxShadow(
//                            color: Colors.red,
//                            offset: Offset(20, 15),
//                          )
//                        ],
//                      ),
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
//        print(snapshot.data["categoriaservico"].length);
//        print(index);
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
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                TelaListaPrestadores(
                  cdgCategoria: snapshot.data["categoriaservico"][index]["cdgCategoria"],
                  categoria_descricao: snapshot.data["categoriaservico"][index]["descricao"],
                ),
            ),
            );
          },
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
//                  print("GestureDetector, onTap acionado");
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
      elevation: 10.0,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
//      ),
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
                      GradientButton(
                        gradient: LinearGradient(

                          colors: [
                            const Color(0xFFe60000),
                            const Color(0xFFe60000),
                            const Color(0xFFff4d4d),
                            const Color(0xFFe60000),
                            const Color(0xFFe60000),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        elevation: 15,
                        child: Text("CANCELAR", style: TextStyle(fontSize: 15.0),),
                        callback: () {
                        },
                        increaseWidthBy: 30.0,
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
    //print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
              future: ServicosModel.of(context).getTopPrestadores(),
              //future: _getDados(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      decoration: BoxDecoration(
                      ),
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
      itemCount: snapshot.data["Custom"].length,
      itemBuilder: (context, index) {
//        print(snapshot.data["pessoa"].length);
//        print(index);
        return CardPrestador(context, snapshot, index);//getCard(context, snapshot, index);
      },
    );
  }

  Widget getCard(context, snapshot, index) {
    return Card(
      elevation: 10.0,
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
                          (snapshot.data["Custom"][index]["imagem"] == null ||
                                  snapshot.data["Custom"][index]["imagem"].length == 0)
                              ? Icon(
                                  Icons.account_circle,
                                  size: 60,
                                  color: Theme.of(context).primaryColor,
                                )
                              : // Image.network(snapshot.data["pessoa"][index]["imagem"]),

                              //container para deixar imagem circular
                              Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(snapshot
                                          .data["Custom"][index]["imagem"]),
                                    ),
                                  ),
                                ),

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
                        snapshot.data["Custom"][index]["nome"],
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
                        (snapshot.data["Custom"][index]["email"].length <= 15)
                            ? snapshot.data["Custom"][index]["email"]
                            : '${snapshot.data["Custom"][index]["email"].substring(0, 15)}...', //"Pedreiro",
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        snapshot.data["Custom"][index]["notaPrestador"],
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
                      GradientButton(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF666666),
                            Color(0xFF808080),
                            Color(0xFF808080),
                            Color(0xFFb3b3b3),
                            Color(0xFF808080),
                            Color(0xFF666666),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        child: Text("Ver Perfil",
                          style: TextStyle(fontSize: 15.0),
                        ),
                        elevation: 20,
                          callback: () {
//                          String cdgPessoa = snapshot.data["pessoa"][index]["cdgPessoa"];


//                          print("${snapshot.data["pessoa"][index]}");
//                          print("${snapshot.data["pessoa"][index]["cdgPessoa"]}");

                            String cdgPessoa = snapshot.data["Custom"][index]["cdgPessoa"];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaPerfilPrestador(
                                    // nao me acertei em mandar direto o map da pessoa, por hora mando codigo
                                    //pessoa: snapshot.data["pessoa"][index],
                                    cdgPessoa: cdgPessoa,
                                  )
                              ),
                            );
                        },
                        increaseWidthBy: 25.0,
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
