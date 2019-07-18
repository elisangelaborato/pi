import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pi/card/card_avaliacao.dart';
import 'dart:convert';

class TabAvaliacaoPrestador extends StatefulWidget {

  final String cdgPessoa_prestador;

  TabAvaliacaoPrestador(this.cdgPessoa_prestador);

  @override
  _TabAvaliacaoPrestadorState createState() => _TabAvaliacaoPrestadorState(cdgPessoa_prestador);
}

class _TabAvaliacaoPrestadorState extends State<TabAvaliacaoPrestador> {

  final String cdgPessoa_prestador;

  _TabAvaliacaoPrestadorState(this.cdgPessoa_prestador);

  Future<Map> _getDados() async {
    String where = " WHERE age.situacaoAgendamento = \"EXECUTADO\"  ";
    if (cdgPessoa_prestador != null)
      if (!(cdgPessoa_prestador.isEmpty ||
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
    return FutureBuilder(
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
        });
//    return SingleChildScrollView(
//      child: Container(
//        child: new Center(
//          child: new Column(
//            children: <Widget>[
//              getCard(),
//              getCard(),
//              getCard(),
//              getCard(),
//              getCard(),
//            ],
//          ),
//        ),
//      ),
//    );
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

//  Widget getCard() {
//    return Card(
//      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
//      child: SizedBox(
//          height: 80.0,
//          width: double.infinity,
//          child: Padding(
//            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//            child: Row(
//              children: <Widget>[
//                CircleAvatar(
//                  radius: 30.0,
//                  backgroundColor: Colors.transparent,
//                  backgroundImage: ExactAssetImage('images/person.png'),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 8, left: 8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        "Maria Antonieta",
//                        style: Theme.of(context).textTheme.subhead,
//                      ),
//                      Container(
//                        width: MediaQuery.of(context).size.width * 0.72,
//                        height: 30.0,
//                        child: Text(
//                          "Mussum Ipsum, cacilds vidis litro abertis. A ordem dos tratores não altera o pão duris. Detraxit consequat et quo num tendi nada. Manduma pindureta quium dia nois paga. Suco de cevadiss deixa as pessoas mais interessantis.",
//                          style: TextStyle(fontSize: 12.0),
//                          overflow: TextOverflow.ellipsis,
//                          maxLines: 2,
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 4.0),
//                      ),
//                      Text(
//                        "100.0",
//                        style: TextStyle(
//                            fontSize: 12.0, fontWeight: FontWeight.bold),
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
