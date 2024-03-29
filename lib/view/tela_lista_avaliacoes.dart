import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pi/card/card_avaliacao.dart';
import 'dart:convert';

import 'package:pi/model/pessoa_model.dart';

class TelaListaAvaliacoes extends StatelessWidget {
  final String cdgPessoa_cliente;
  final String cdgPessoa_prestador;

  TelaListaAvaliacoes({this.cdgPessoa_cliente, this.cdgPessoa_prestador});

  Future<Map> _getDados() async {
    String where = " WHERE age.situacaoAgendamento = \"EXECUTADO\"  ";
    if (cdgPessoa_cliente != null) if (!(cdgPessoa_cliente.isEmpty ||
        cdgPessoa_cliente.trim().length == 0))
      where += " AND cli.cdgPessoa = $cdgPessoa_cliente ";

    if (where.trim() == "" &&
        (cdgPessoa_prestador != null)) if (!(cdgPessoa_prestador
        .isEmpty ||
        cdgPessoa_prestador.trim().length == 0))
      where += " AND prt.cdgPessoa = $cdgPessoa_prestador ";

    String sql =
        "SELECT age.cdgAgendamento, cli.cdgPessoa cli_cdgPessoa, cli.nome cli_nome, cli.imagem cli_image,  prt.cdgPessoa prt_cdgPessoa, prt.nome prt_nome, prt.imagem prt_image,  ser.nome ser_nome, age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento, age.preco, age.avaliacaoCliente, age.comentarioCliente, age.avaliacaoPrestador, age.comentarioPrestador FROM agendamento age LEFT JOIN pessoa cli ON cli.cdgPessoa = age.cdgPessoa_cliente LEFT JOIN pessoa prt ON prt.cdgPessoa = age.cdgPessoa_prestador LEFT JOIN servico ser ON ser.cdgServico = age.cdgServico $where ORDER BY age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento ";

    http.Response response;
    response =
    await http.get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: PessoaModel.of(context).isLogadoComoCliente()
              ? [
            Color(0xFF000033),
            Color(0xFF000066),
            Color(0xFF000080),
            Color(0xFF0000b3),
            Color(0xFF0000e6),
            Color(0xFF0000ff),
          ]
              : [
            Color(0xFFb30000),
            Color(0xFFcc0000),
            Color(0xFFe60000),
            Color(0xFFff1a1a),
            Color(0xFFff1a1a),
            Color(0xFFe60000),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
        title: Text("Avaliações"),
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
    return ListView.builder(
      itemCount: snapshot.data["Custom"].length,
      itemBuilder: (context, index) {
//        print(snapshot.data["pessoa"].length);
//        print(index);
        //return getCard(context, snapshot, index);
        return CardAvaliacao(context, snapshot, index);
      },
    );
  }

//  Widget buildCardAgendamento(context, snapshot, index) {
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: SizedBox(
//          height: 95.0,
//          width: double.infinity,
//          child: Row(
//            children: <Widget>[
//              buildCircleAvatar(context, snapshot, index),
//              SizedBox(width: 4.0,),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  //linha: data, hora e valor
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.75,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        Text(
//                          "${snapshot.data["Custom"][index]["dataAgendamento"]} "
//                          "${snapshot.data["Custom"][index]["horaAgendamento"]}",
//                          style: TextStyle(
//                              fontSize: 12.0, fontWeight: FontWeight.w500),
//                        ),
//                        Text(
//                          "R\$ ${snapshot.data["Custom"][index]["preco"]}",
//                          style: TextStyle(
//                              fontSize: 12.0, fontWeight: FontWeight.w500),
//                        ),
//                      ],
//                    ),
//                  ),
//
//                  //linha: nome cliente ou fornecedor, servico
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.75,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        Text(
//                          PessoaModel.of(context).isLogadoComoCliente()
//                              ? snapshot.data["Custom"][index]["prt_nome"]
//                              : snapshot.data["Custom"][index]["cli_nome"],
//                          style: TextStyle(fontSize: 12.0),
//                        ),
//                        Text(
//                          snapshot.data["Custom"][index]["ser_nome"] ?? "",
//                          style: TextStyle(fontSize: 12.0),
//                        ),
//                      ],
//                    ),
//                  ),
//
//                  SizedBox(
//                    height: 4.0,
//                  ),
//
//                  //comentario
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.75,
//                    child: Text(
//                      PessoaModel.of(context).isLogadoComoCliente()
//                          ? snapshot.data["Custom"][index]
//                              ["comentarioPrestador"]
//                          : snapshot.data["Custom"][index]["comentarioCliente"],
//                      textAlign: TextAlign.justify,
//                      overflow: TextOverflow.ellipsis,
//                      maxLines: 3,
//                      style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 4.0,
//                  ),
//                  //nota alinhado direita
//                  Container(
//                    width: MediaQuery.of(context).size.width * 0.75,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.end,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        Text("Avaliação ", style: TextStyle(fontSize: 12.0)),
//                        Text(
//                          PessoaModel.of(context).isLogadoComoCliente()
//                              ? snapshot.data["Custom"][index]
//                          ["avaliacaoPrestador"]
//                              : snapshot.data["Custom"][index]["avaliacaoCliente"],
//                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
//                        ),
//                      ],
//                    ),
//                  ),
//
////                  Row(
////                    children: <Widget>[
////                      snapshot.data["Custom"][index]["situacaoAgendamento"] ==
////                              "EXECUTADO"
////                          ? Icon(
////                              Icons.check_box,
////                              color: Colors.green,
////                            )
////                          : snapshot.data["Custom"][index]
////                                      ["situacaoAgendamento"] ==
////                                  "AGENDADO"
////                              ? Icon(Icons.notifications, color: Colors.amber)
////                              : Icon(Icons.notifications_off,
////                                  color: Colors.grey),
////                      Text(snapshot.data["Custom"][index]
////                              ["situacaoAgendamento"] ??
////                          ""),
////                    ],
////                  ),
//
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget buildCircleAvatar(context, snapshot, index) {
//    //se cliente logado, vai ver imagem do prestador que o avaliou
//    //se prestador logado, vai ver imagem do cliente que o avaliou
//    String imagem;
//    if (PessoaModel.of(context).isLogadoComoCliente())
//      imagem = snapshot.data["Custom"][index]["prt_image"];
//    else
//      imagem = snapshot.data["Custom"][index]["cli_image"];
//
//    return CircleAvatar(
//      child:
//          //se imagem nula ou em branco, coloca icone padrao
//          (imagem == null || imagem == 0)
//              ? Icon(
//                  Icons.account_circle,
//                  size: 60,
//                  color: Theme.of(context).primaryColor,
//                )
//              :
//              //container para deixar imagem circular
//              Container(
//                  width: 60.0,
//                  height: 60.0,
//                  decoration: new BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: new DecorationImage(
//                      fit: BoxFit.fill,
//                      image: new NetworkImage(imagem),
//                    ),
//                  ),
//                ),
//      radius: 30,
//      backgroundColor: Colors.transparent,
//    );
//  }

//  Widget getCard(context, snapshot, index) {
//    return Card(
//      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
//      child: SizedBox(
//          height: 100.0,
//          width: double.infinity,
//          child: Padding(
//            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    CircleAvatar(
//                      child:
//                          //se imagem nula ou em branco, coloca icone padrao
//                          (snapshot.data["Custom"][index]["prt_image"] ==
//                                      null ||
//                                  snapshot.data["Custom"][index]["prt_image"]
//                                          .length ==
//                                      0)
//                              ? Icon(
//                                  Icons.account_circle,
//                                  size: 60,
//                                  color: Theme.of(context).primaryColor,
//                                )
//                              : // Image.network(snapshot.data["pessoa"][index]["imagem"]),
//
//                              //container para deixar imagem circular
//                              Container(
//                                  width: 60.0,
//                                  height: 60.0,
//                                  decoration: new BoxDecoration(
//                                    shape: BoxShape.circle,
//                                    image: new DecorationImage(
//                                      fit: BoxFit.fill,
//                                      image: new NetworkImage(snapshot
//                                          .data["Custom"][index]["prt_image"]),
//                                    ),
//                                  ),
//                                ),
//
////                          //Icon(Icons.person, size: 60, color: Theme.of(context).primaryColor,),
////                          Image.network(
////                              "http://images.coveralia.com/autores/thumbs/belchior81574m.jpg"),
//                      radius: 30,
//                      backgroundColor: Colors.transparent,
//                    ),
//                    Text(
//                      snapshot.data["Custom"][index]["prt_nome"],
//                      style: TextStyle(
//                        fontSize: 16,
//                      ),
//                    ),
//                    Text(
//                      snapshot.data["Custom"][index]["ser_nome"],
//                      style: TextStyle(
//                        color: Colors.grey,
//                        fontSize: 12,
//                      ),
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 0),
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      Text(
//                        "Data/Hora",
//                        style: TextStyle(
//                          fontSize: 16,
//                        ),
//                      ),
//                      Text(
//                        "${snapshot.data["Custom"][index]["dataAgendamento"]} - ${snapshot.data["Custom"][index]["horaAgendamento"]}",
//                        style: TextStyle(
//                          color: Colors.grey,
//                          fontSize: 12,
//                        ),
//                      ),
//                      Divider(
//                        height: 4,
//                      ),
//                      Text(
//                        "Nota",
//                        style: TextStyle(fontSize: 16),
//                      ),
//                      Text(
//                        "${snapshot.data["Custom"][index]["avaliacaoPrestador"]}",
//                        style: TextStyle(
//                          color: Colors.grey,
//                          fontSize: 12,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 0),
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      Divider(
//                        height: 0,
//                      ),
//                      Text(
//                          "${snapshot.data["Custom"][index]["comentarioPrestador"]}"),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          )),
//    );
//  }
}
