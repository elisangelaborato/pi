import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pi/card/card_agendamento.dart';

Widget FutureBuilderListaAgendamentos({cdgPessoa_cliente, cdgPessoa_prestador}){
  return FutureBuilder(
      future: _getDados(cdgPessoa_cliente, cdgPessoa_prestador),
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
                return Container(color: Colors.white,
                  child: Center(
                    child: Text("Lista esta vazia."),
                  ),);
              else
                return _createCadList(context, snapshot);
            }
        }
      });
}

Future<Map> _getDados(cdgPessoa_cliente, cdgPessoa_prestador) async {
  print("oi");

  String where = " ";
  if (cdgPessoa_cliente != null)
    if (!(cdgPessoa_cliente.isEmpty || cdgPessoa_cliente.trim().length == 0))
      where = " WHERE cli.cdgPessoa = $cdgPessoa_cliente ";

  if (where.trim()=="" && (cdgPessoa_prestador != null))
    if (!(cdgPessoa_prestador.isEmpty || cdgPessoa_prestador.trim().length == 0))
      where = " WHERE prt.cdgPessoa = $cdgPessoa_prestador ";

  String sql = "SELECT age.cdgAgendamento, cli.cdgPessoa cli_cdgPessoa, cli.nome cli_nome, cli.imagem cli_image, prt.cdgPessoa prt_cdgPessoa, prt.nome prt_nome, prt.imagem prt_image, ser.nome ser_nome, age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento, age.preco  FROM agendamento age LEFT JOIN pessoa cli ON cli.cdgPessoa = age.cdgPessoa_cliente LEFT JOIN pessoa prt ON prt.cdgPessoa = age.cdgPessoa_prestador LEFT JOIN servico ser ON ser.cdgServico = age.cdgServico $where ORDER BY age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento  ";

  http.Response response;
  response = await http
      .get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
  //print("${response.body}");
  return json.decode(response.body);
}

Widget _createCadList(context, snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["Custom"].length,
    itemBuilder: (context, index) {
//        print(snapshot.data["pessoa"].length);
//        print(index);
      return CardAgendamento(context, snapshot, index);//getCard(context, snapshot, index);
    },
  );
}