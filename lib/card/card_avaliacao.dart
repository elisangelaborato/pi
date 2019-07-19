import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';

Widget CardAvaliacao(context, snapshot, index) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 95.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            buildCircleAvatar(context, snapshot, index),
            SizedBox(width: 4.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //linha: data, hora e valor
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "${snapshot.data["Custom"][index]["dataAgendamento"]} "
                            "${snapshot.data["Custom"][index]["horaAgendamento"]}",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "R\$ ${snapshot.data["Custom"][index]["preco"]}",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                //linha: nome cliente ou fornecedor, servico
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        PessoaModel.of(context).isLogadoComoCliente()
                            ? snapshot.data["Custom"][index]["prt_nome"]
                            : snapshot.data["Custom"][index]["cli_nome"],
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        snapshot.data["Custom"][index]["ser_nome"] ?? "",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 4.0,
                ),

                //comentario
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    PessoaModel.of(context).isLogadoComoCliente()
                        ? snapshot.data["Custom"][index]
                    ["comentarioPrestador"]
                        : snapshot.data["Custom"][index]["comentarioCliente"],
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                //nota alinhado direita
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Avaliação ", style: TextStyle(fontSize: 12.0)),
                      Text(
                        PessoaModel.of(context).isLogadoComoCliente()
                            ? snapshot.data["Custom"][index]
                        ["avaliacaoPrestador"]
                            : snapshot.data["Custom"][index]["avaliacaoCliente"],
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

//                  Row(
//                    children: <Widget>[
//                      snapshot.data["Custom"][index]["situacaoAgendamento"] ==
//                              "EXECUTADO"
//                          ? Icon(
//                              Icons.check_box,
//                              color: Colors.green,
//                            )
//                          : snapshot.data["Custom"][index]
//                                      ["situacaoAgendamento"] ==
//                                  "AGENDADO"
//                              ? Icon(Icons.notifications, color: Colors.amber)
//                              : Icon(Icons.notifications_off,
//                                  color: Colors.grey),
//                      Text(snapshot.data["Custom"][index]
//                              ["situacaoAgendamento"] ??
//                          ""),
//                    ],
//                  ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCircleAvatar(context, snapshot, index) {
  //se cliente logado, vai ver imagem do prestador que o avaliou
  //se prestador logado, vai ver imagem do cliente que o avaliou
  String imagem;
  if (PessoaModel.of(context).isLogadoComoCliente())
    imagem = snapshot.data["Custom"][index]["prt_image"];
  else
    imagem = snapshot.data["Custom"][index]["cli_image"];

  return CircleAvatar(
    child:
    //se imagem nula ou em branco, coloca icone padrao
    (imagem == null || imagem == 0)
        ? Icon(
      Icons.account_circle,
      size: 60,
      color: Theme.of(context).primaryColor,
    )
        :
    //container para deixar imagem circular
    Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(imagem),
        ),
      ),
    ),
    radius: 30,
    backgroundColor: Colors.transparent,
  );
}
