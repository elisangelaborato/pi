import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pi/card/card_agendamento.dart';

class TelaListaAgendamentos extends StatelessWidget {

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final String cdgPessoa_cliente;
  final String cdgPessoa_prestador;

  TelaListaAgendamentos({this.cdgPessoa_cliente, this.cdgPessoa_prestador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000033),
            Color(0xFF000066),
            Color(0xFF000080),
            Color(0xFF0000b3),
            Color(0xFF0000e6),
            Color(0xFF0000ff),
          ],
        ),
        title: Text("Histórico"),
        actions: <Widget>[
          Icon(Icons.search),
        ],
      ),
      body: FutureBuilder(
          future: _getDados(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
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
                  if (snapshot.data["Custom"].length == 0)
                    return Container(
                      color: Colors.white,
                      child: Center(
                        child: Text("Lista esta vazia."),
                      ),
                    );
                  else
                    return _createCadList(context, snapshot);
                }
            }
          }),
    );
  }

  Widget _createCadList(context, snapshot) {
//    print(snapshot.data);
//    print(snapshot.data["Custom"][0]["situacaoAgendamento"]);
    return ListView.builder(
      itemCount: snapshot.data["Custom"].length,
      itemBuilder: (context, index) {
//        print(snapshot.data["pessoa"].length);
//        print(index);
//        return CardAgendamento(
//            context, snapshot, index); //getCard(context, snapshot, index);
        return

          Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          direction: DismissDirection.startToEnd,
          // Show a red background as the item is swiped away.
            background: Container(
              color:
              snapshot.data["Custom"][index]["situacaoAgendamento"] == "AGENDADO"
                  ? Colors.green
                  : Colors.red,
              child: Align(
                child: Icon(
                  snapshot.data["Custom"][index]["situacaoAgendamento"] == "AGENDADO"
                      ? Icons.cancel
                      : Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment(-0.9, 0.0),
              ),
            ),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            String dataHoraAgendamento = "Agendamento ${snapshot.data["Custom"][index]["dataAgendamento"]} "
                "${snapshot.data["Custom"][index]["horaAgendamento"]}";
            // Remove the item from the data source.
            //setState(() {
            //  _lastRemoved = Map.from(snapshot[index]);
            //  _lastRemovedPos = index;
            //  _toDoList.removeAt(index);
            //  ToDo: persistir no banco de dados a exclusao
            //  _saveData();
            //});

            // Then show a snackbar.
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content:
                snapshot.data["Custom"][index]["situacaoAgendamento"] == "AGENDADO"
                    ? Text("$dataHoraAgendamento CANCELADO.")
                    : Text("$dataHoraAgendamento EXCLUIDO."),
                action: SnackBarAction(
                  label: 'DESFAZER',
                  onPressed: () {

                    //setState(() {
                    //  _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    //  ToDo: persistir no banco de dados a inclusao
                    //  _saveData();
                    //});
                  },
                ),
              ),
            );
          },
          child: CardAgendamento(
              context, snapshot, index), //getCard(context, snapshot, index);,
        );
      },
    );
  }

  Widget getCard(context, snapshot, index) {
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
                      child:
                          //se imagem nula ou em branco, coloca icone padrao
                          (snapshot.data["Custom"][index]["prt_image"] ==
                                      null ||
                                  snapshot.data["Custom"][index]["prt_image"]
                                          .length ==
                                      0)
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
                                          .data["Custom"][index]["prt_image"]),
                                    ),
                                  ),
                                ),

//                          //Icon(Icons.person, size: 60, color: Theme.of(context).primaryColor,),
//                          Image.network(
//                              "http://images.coveralia.com/autores/thumbs/belchior81574m.jpg"),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      snapshot.data["Custom"][index]["prt_nome"],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      snapshot.data["Custom"][index]["ser_nome"],
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
                        "${snapshot.data["Custom"][index]["dataAgendamento"]} - ${snapshot.data["Custom"][index]["horaAgendamento"]}",
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
                        "R\$ ${snapshot.data["Custom"][index]["preco"]}",
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
                      snapshot.data["Custom"][index]["situacaoAgendamento"] ==
                              "AGENDADO"
                          ? GradientButton(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFe60000),
                                  const Color(0xFFe60000),
                                  const Color(0xFFff4d4d),
                                  const Color(0xFFe60000),
                                  const Color(0xFFff1a1a),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.center,
                              ),
                              child: Text(
                                "CANCELAR",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              callback: () {},
                              increaseWidthBy: 30.0,
                            )
                          : GradientButton(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFe60000),
                                  const Color(0xFFe60000),
                                  const Color(0xFFff4d4d),
                                  const Color(0xFFe60000),
                                  const Color(0xFFff1a1a),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.center,
                              ),
                              child: Text(
                                "EXCLUIR",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              callback: () {},
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

  Future<Map> _getDados() async {
    print("oi");

    String where = " ";
    if (cdgPessoa_cliente != null) if (!(cdgPessoa_cliente.isEmpty ||
        cdgPessoa_cliente.trim().length == 0))
      where = " WHERE cli.cdgPessoa = $cdgPessoa_cliente ";

    if (where.trim() == "" &&
        (cdgPessoa_prestador != null)) if (!(cdgPessoa_prestador
        .isEmpty ||
        cdgPessoa_prestador.trim().length == 0))
      where = " WHERE prt.cdgPessoa = $cdgPessoa_prestador ";

    String sql =
        "SELECT age.cdgAgendamento, cli.cdgPessoa cli_cdgPessoa, cli.nome cli_nome, cli.imagem cli_image, prt.cdgPessoa prt_cdgPessoa, prt.nome prt_nome, prt.imagem prt_image, ser.nome ser_nome, age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento, age.preco  FROM agendamento age LEFT JOIN pessoa cli ON cli.cdgPessoa = age.cdgPessoa_cliente LEFT JOIN pessoa prt ON prt.cdgPessoa = age.cdgPessoa_prestador LEFT JOIN servico ser ON ser.cdgServico = age.cdgServico $where ORDER BY age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento  ";

    http.Response response;
    response =
    await http.get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
    //print("${response.body}");
    return json.decode(response.body);
  }
}
