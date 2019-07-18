import 'package:flutter/material.dart';

class TabAvaliacaoCliente extends StatefulWidget {
  @override
  _TabAvaliacaoClienteState createState() => _TabAvaliacaoClienteState();
}

class _TabAvaliacaoClienteState extends State<TabAvaliacaoCliente> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              getCard(),
              getCard(),
              getCard(),
              getCard(),
              getCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard() {
    return Card(
      elevation: 15,
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 80.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('images/person.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Maria Antonieta",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.72,
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
              ],
            ),
          )),
    );
  }
}
