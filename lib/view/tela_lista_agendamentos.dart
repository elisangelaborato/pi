import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaListaAgendamentos extends StatelessWidget {

  final String cdgPessoa_cliente;
  final String cdgPessoa_prestador;

  TelaListaAgendamentos({this.cdgPessoa_cliente, this.cdgPessoa_prestador});

  Future<Map> _getDados() async {

    String where = " ";
    if (!(cdgPessoa_cliente.isEmpty || cdgPessoa_cliente.trim().length == 0))
      where = " WHERE cli.cdgPessoa = $cdgPessoa_cliente ";
    else
    if (!(cdgPessoa_prestador.isEmpty || cdgPessoa_prestador.trim().length == 0))
      where = " WHERE prt.cdgPessoa = $cdgPessoa_prestador ";

    String sql = "SELECT age.cdgAgendamento, cli.cdgPessoa cli_cdgPessoa, cli.nome cli_nome, cli.imagem cli_image, prt.cdgPessoa prt_cdgPessoa, prt.nome prt_nome, prt.imagem prt_image, ser.nome ser_nome, age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento, age.preco  FROM agendamento age LEFT JOIN pessoa cli ON cli.cdgPessoa = age.cdgPessoa_cliente LEFT JOIN pessoa prt ON prt.cdgPessoa = age.cdgPessoa_prestador LEFT JOIN servico ser ON ser.cdgServico = age.cdgServico $where ORDER BY age.dataAgendamento, age.horaAgendamento, age.situacaoAgendamento  ";

    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=$sql");
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Histórico"),
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
        return getCard(context, snapshot, index);
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
                      (snapshot.data["Custom"][index]["prt_image"] == null ||
                          snapshot.data["Custom"][index]["prt_image"].length == 0)
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

                      snapshot.data["Custom"][index]["situacaoAgendamento"] == "AGENDADO"
                      ?
                      GradientButton(
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
                        child: Text("CANCELAR", style: TextStyle(fontSize: 15.0),),
                        callback: () {
                        },
                        increaseWidthBy: 30.0,
                      )
                      :
                      GradientButton(
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
                        child: Text("EXCLUIR", style: TextStyle(fontSize: 15.0),),
                        callback: () {
                        },
                        increaseWidthBy: 30.0,
                      )
                      ,

                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

}
