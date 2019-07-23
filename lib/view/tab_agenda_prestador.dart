import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/view/tela_agendamento_prestador.dart';

class TabAgendaPrestador extends StatefulWidget {
  @override
  _TabAgendaPrestadorState createState() => _TabAgendaPrestadorState();
}

class _TabAgendaPrestadorState extends State<TabAgendaPrestador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
//          );
//        },
//        child: Icon(Icons.add),
//      ),
      body: SingleChildScrollView(
        child: Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                GestureDetector(
                  child: getCard(),
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
//                    );
                  },
                ),

                GestureDetector(
                  child: getCard(),
                  onTap: () {
                    print("GestureDetector, onTap acionado");
                  },
                ),

                GestureDetector(
                  child: getCard(),
                  onTap: () {
                    print("GestureDetector, onTap acionado");
                  },
                ),

                GestureDetector(
                  child: getCard(),
                  onTap: () {
                    print("GestureDetector, onTap acionado");
                  },
                ),

                GestureDetector(
                  child: getCard(),
                  onTap: () {
                    print("GestureDetector, onTap acionado");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCard() {
    return Card(
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 80.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: <Widget>[
//                CircleAvatar(
//                  radius: 30.0,
//                  backgroundColor: Colors.transparent,
//                  backgroundImage: ExactAssetImage('images/person.png'),
//                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "01/01/2020 - Cliente Fulano de Tal",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 30.0,
                        child: Text(
                          "Mussum Ipsum, cacilds vidis litro abertis. A ordem dos tratores não altera o pão duris. Detraxit consequat et quo num tendi nada. Manduma pindureta quium dia nois paga. Suco de cevadiss deixa as pessoas mais interessantis.",
                          style: TextStyle(fontSize: 12.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                      ),
                      Text(
                        "100.0",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(320, 185, 0, 10),
                  child:CircularGradientButton(
                    gradient: LinearGradient(colors: [
                      Color(0xFFb30000),
                      Color(0xFFcc0000),
                      Color(0xFFe60000),
                      Color(0xFFe60000),
                      Color(0xFFff0000),
                      Color(0xFFff0000),
                    ]),
                    child: Icon(Icons.add),
                    callback: () {

                      //////////tem q voltar isso aqui com o codigo do pretador
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
                      );*/
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
