import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pi/card/card_prestador.dart';
import 'dart:convert';
import 'package:pi/view/tela_perfil_prestador.dart';

class TelaListaPrestadores extends StatelessWidget {

  final String cdgCategoria;
  final String categoria_descricao;

  TelaListaPrestadores({this.cdgCategoria, this.categoria_descricao});

  Future<Map> _getDados() async {
    String sql;
    if (cdgCategoria.isEmpty || cdgCategoria.trim().length == 0)
//se cdgCategoria em branco/nulo: tras todos os prestadores
//    SELECT pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa
//    FROM pessoa
//    WHERE pr.ativoPrestador = 1
//    LEFT JOIN prestador ON prestador.cdgPessoa = pessoa.cdgPessoa
//    ORDER BY pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa
    sql = "SELECT pessoa.nome, pessoa.imagem, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa, sobreMimPrestador FROM pessoa WHERE prestador.ativoPrestador = 1 LEFT JOIN prestador ON prestador.cdgPessoa = pessoa.cdgPessoa ORDER BY pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa ";
    else {
//se cdgCategoria informado: tras os prestadores que tenham servicos cadastrados para a categoria informada
//    SELECT pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa
//    FROM pessoa
//    LEFT JOIN prestador ON prestador.cdgPessoa = pessoa.cdgPessoa
//    LEFT JOIN prestadorservico ON prestadorservico.cdgPessoa = prestador.cdgPessoa
//    LEFT JOIN servico ON servico.cdgServico = prestadorservico.cdgServico
//    LEFT JOIN categoriaservico ON categoriaservico.cdgCategoria = servico.cdgCategoria
//    WHERE pr.ativoPrestador = 1 AND categoriaservico.cdgCategoria = 5
//    GROUP BY pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa
      sql = "SELECT pessoa.nome,  pessoa.imagem, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa, sobreMimPrestador FROM pessoa LEFT JOIN prestador ON prestador.cdgPessoa = pessoa.cdgPessoa LEFT JOIN prestadorservico ON prestadorservico.cdgPessoa = prestador.cdgPessoa LEFT JOIN servico ON servico.cdgServico = prestadorservico.cdgServico LEFT JOIN categoriaservico ON categoriaservico.cdgCategoria = servico.cdgCategoria WHERE prestador.ativoPrestador = 1 AND categoriaservico.cdgCategoria = $cdgCategoria GROUP BY pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa ORDER BY pessoa.nome, pessoa.email, prestador.notaPrestador, pessoa.cdgPessoa ";
    }
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
    //print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xFFb30000),
            Color(0xFFcc0000),
            Color(0xFFe60000),
            Color(0xFFff1a1a),
            Color(0xFFff1a1a),
            Color(0xFFe60000),
          ],
        ),
        title: Text( categoria_descricao ?? "Prestadores de Serviços"),
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
                    return Container(color: Colors.white,
                      child: Center(
                        child: Text("Lista esta vazia."),
                      ),);
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
        return CardPrestador(context, snapshot, index);
      },
    );
  }

//  Widget getCard(context, snapshot, index) {
//    return Card(
//      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
//      child: SizedBox(
//          height: 80.0,
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
//                      //se imagem nula ou em branco, coloca icone padrao
//                      (snapshot.data["Custom"][index]["imagem"] == null ||
//                          snapshot.data["Custom"][index]["imagem"].length == 0)
//                          ? Icon(
//                        Icons.account_circle,
//                        size: 60,
//                        color: Theme.of(context).primaryColor,
//                      )
//                          : // Image.network(snapshot.data["pessoa"][index]["imagem"]),
//
//                      //container para deixar imagem circular
//                      Container(
//                        width: 60.0,
//                        height: 60.0,
//                        decoration: new BoxDecoration(
//                          shape: BoxShape.circle,
//                          image: new DecorationImage(
//                            fit: BoxFit.fill,
//                            image: new NetworkImage(snapshot
//                                .data["Custom"][index]["imagem"]),
//                          ),
//                        ),
//                      ),
//
////                          //Icon(Icons.person, size: 60, color: Theme.of(context).primaryColor,),
////                          Image.network(
////                              "http://images.coveralia.com/autores/thumbs/belchior81574m.jpg"),
//                      radius: 30,
//                      backgroundColor: Colors.transparent,
//                    ),
////                    Text(
////                      "Cliente",
////                      style: TextStyle(fontSize: 16,),
////                    ),
////                    Text(
////                      "Maycon",
////                      style: TextStyle(color: Colors.grey, fontSize: 12,),
////                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 0),
//                  child: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        snapshot.data["Custom"][index]["nome"],
//                        style: TextStyle(
//                            fontSize: 16, fontWeight: FontWeight.bold),
//                      ),
////                      Text(
////                        "14/08 - 13:30",
////                        style: TextStyle(color: Colors.grey, fontSize: 12,),
////                      ),
//                      Divider(
//                        height: 4,
//                      ),
//                      Text(
//                        (snapshot.data["Custom"][index]["email"].length <= 15)
//                            ? snapshot.data["Custom"][index]["email"]
//                            : '${snapshot.data["Custom"][index]["email"].substring(0, 15)}...', //"Pedreiro",
//                        style: TextStyle(fontSize: 14),
//                      ),
//                      Divider(
//                        height: 4,
//                      ),
//                      Text(
//                        snapshot.data["Custom"][index]["notaPrestador"],
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
//                      GradientButton(
//                        gradient: LinearGradient(
//                          colors: [
//                            Color(0xFF000033),
//                            Color(0xFF000066),
//                            Color(0xFF000080),
//                            Color(0xFF0000b3),
//                            Color(0xFF0000e6),
//                            Color(0xFF0000ff),
//                          ],
//                          begin: Alignment.centerLeft,
//                          end: Alignment.center,
//                        ),
//
//                        child: Text("Ver Perfil",
//                          style: TextStyle(fontSize: 15.0),
//                        ),
//
//                        callback: () {
////                          String cdgPessoa = snapshot.data["pessoa"][index]["cdgPessoa"];
//
//
////                          print("${snapshot.data["pessoa"][index]}");
////                          print("${snapshot.data["pessoa"][index]["cdgPessoa"]}");
//
//                          String cdgPessoa = snapshot.data["Custom"][index]["cdgPessoa"];
//
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => TelaPerfilPrestador(
//                                  // nao me acertei em mandar direto o map da pessoa, por hora mando codigo
//                                  //pessoa: snapshot.data["pessoa"][index],
//                                  cdgPessoa: cdgPessoa,
//                                )
//                            ),
//                          );
//                        },
//                        increaseWidthBy: 35.0,
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          )),
//    );
//  }
}
