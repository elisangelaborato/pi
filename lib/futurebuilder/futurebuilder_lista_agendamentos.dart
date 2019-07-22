import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pi/card/card_agendamento.dart';

Widget FutureBuilderListaAgendamentos(
    {cdgPessoa_cliente, cdgPessoa_prestador, situacaoAgendamento, @required GlobalKey<ScaffoldState> scaffoldKey}) {
  return FutureBuilder(
      future: _getDados(
          cdgPessoa_cliente, cdgPessoa_prestador, situacaoAgendamento),
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
                return _createCadList(context, snapshot, scaffoldKey);
            }
        }
      });
}

Future<Map> _getDados(
    cdgPessoa_cliente, cdgPessoa_prestador, situacaoAgendamento) async {
  //print("oi");

  String where = " ";
  if (cdgPessoa_cliente != null) if (!(cdgPessoa_cliente.isEmpty ||
      cdgPessoa_cliente.trim().length == 0))
    where = " WHERE cli.cdgPessoa = $cdgPessoa_cliente ";

  if (where.trim() == "" &&
      (cdgPessoa_prestador != null)) if (!(cdgPessoa_prestador
          .isEmpty ||
      cdgPessoa_prestador.trim().length == 0))
    where = " WHERE prt.cdgPessoa = $cdgPessoa_prestador ";

  if (situacaoAgendamento != null) if (!(situacaoAgendamento.isEmpty ||
      situacaoAgendamento.trim().length == 0)) if (where.trim() == "")
    where = " WHERE situacaoAgendamento = $situacaoAgendamento ";
  else
    where += " AND situacaoAgendamento = \"$situacaoAgendamento\" ";

  String sql =
      "SELECT age.cdgAgendamento, cli.cdgPessoa cli_cdgPessoa, cli.nome cli_nome, cli.imagem cli_image, prt.cdgPessoa prt_cdgPessoa, prt.nome prt_nome, prt.imagem prt_image, ser.nome ser_nome, age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento, age.preco  FROM agendamento age LEFT JOIN pessoa cli ON cli.cdgPessoa = age.cdgPessoa_cliente LEFT JOIN pessoa prt ON prt.cdgPessoa = age.cdgPessoa_prestador LEFT JOIN servico ser ON ser.cdgServico = age.cdgServico $where ORDER BY age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento  ";

  http.Response response;
  response =
      await http.get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
  //print("${response.body}");
  return json.decode(response.body);
}

Widget _createCadList(context, snapshot, GlobalKey<ScaffoldState> scaffoldKey) {
  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  return ListView.builder(
    itemCount: snapshot.data["Custom"].length,
    itemBuilder: (context, index) {
//        print(snapshot.data["pessoa"].length);
//        print(index);
      //return CardAgendamento(context, snapshot, index);//getCard(context, snapshot, index);
      return Dismissible(
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
          scaffoldKey.currentState.showSnackBar(
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
