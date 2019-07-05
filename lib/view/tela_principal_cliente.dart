import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';
import 'package:pi/view/tela_agendamento_cliente.dart';

class TelaPrincipalCliente extends StatefulWidget {
  @override
  _TelaPrincipalClienteState createState() => _TelaPrincipalClienteState();
}

class _TelaPrincipalClienteState extends State<TelaPrincipalCliente> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Serviços",
                ),
                Tab(
                  text: "Prestadores",
                ),
                Tab(
                  text: "Contratados",
                ),
              ],
            ),
            title: Text('Alguz Serviços A à Z'),
            centerTitle: true,
            actions: <Widget>[
              Icon(Icons.search),
            ],
          ),
          drawer: CustomDrawer(),
          body: TabBarView(
            children: [
              ServicosWidget(),
              PrestadoresWidget(),
              //MeusServicosTesteLinha(),
              MeusServicosWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "http://pontoemcomumseguros.com.br/images/icones/lifeline-in-a-heart-outline.png"),
            Icon(Icons.healing, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Saúde"),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "https://library.kissclipart.com/20180831/wcw/kissclipart-icone-professor-png-clipart-teacher-computer-icons-be63703f059606a5.png"),
            Icon(Icons.account_box, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Professores"),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "http://download.seaicons.com/icons/icons8/windows-8/512/Transport-Construction-Worker-icon.png"),
            Icon(Icons.build, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Construção/Manutenção"),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "https://image.flaticon.com/icons/png/512/40/40546.png"),
            Icon(Icons.ac_unit, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Beleza/Estética"),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network(
//                "https://image.flaticon.com/icons/png/512/34/34100.png"),
            Icon(Icons.local_cafe, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Informática"),
        ),
        Divider(
          color: Colors.grey[500],
          height: 0,
        ),
        ListTile(
          leading: CircleAvatar(
            child:
//            Image.network("https://www.lojsnovi.com.br/img/outro.png"),
            Icon(Icons.view_comfy, size: 40, color: Theme.of(context).primaryColor,),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          title: Text("Outros"),
        ),
      ],
    );
  }
}

class MeusServicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  print("GestureDetector, onTap acionado");
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

//    return Padding(
//      padding: const EdgeInsets.only(top: 10),
//      child: Row(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              CircleAvatar(
//                child: Image.network(
//                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
//                radius: 35,
//                backgroundColor: Colors.transparent,
//              ),
//              Text("Profissional", style: TextStyle(fontSize: 20),),
//              Text("Maycon", style: TextStyle(color: Colors.grey),),
//            ],
//          ),
//
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//                Text("Data/Hora", style: TextStyle(fontSize: 20),),
//                Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
//                Divider(
//                  height: 30,
//                ),
//                Text("Valor", style: TextStyle(fontSize: 20),),
//                Text("R\$80,00", style: TextStyle(color: Colors.grey),),
//              ],
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 50),
//            child: Column(
//              children: <Widget>[
//              Divider(
//                height: 60,
//              ),
//                RaisedButton(
//                    onPressed: (){},
//                    child: Text("Cancelar"),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
  }

  Widget getCard(context) {
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
                      child: Icon(Icons.person, size: 35, color: Theme.of(context).primaryColor,),
//                      Image.network(
//                          "https://image.flaticon.com/icons/png/512/10/10003.png"),
                      radius: 20,
                      backgroundColor: Colors.transparent,
                    ),
                    Text(
                      "Cliente",
                      style: TextStyle(fontSize: 16,),
                    ),
                    Text(
                      "Maycon",
                      style: TextStyle(color: Colors.grey, fontSize: 12,),
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
                        style: TextStyle(fontSize: 16,),
                      ),
                      Text(
                        "14/08 - 13:30",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "Valor",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "R\$80,00",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
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
                      RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        child: Text("CANCELAR", style: TextStyle(color: Colors.white),),
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

class PrestadoresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  print("GestureDetector, onTap acionado");
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
              GestureDetector(
                child: getCard(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaAgendamentoCliente()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

//    return Padding(
//      padding: EdgeInsets.only(top: 10),
//      child: Row(
//        children: <Widget>[
//          Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              CircleAvatar(
//                child: Image.network(
//                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
//                radius: 35,
//                backgroundColor: Colors.transparent,
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 20),
//                child: Column(
//                  children: <Widget>[
//                    Text(
//                      "Nome",
//                      style: TextStyle(
//                        fontSize: 20,
//                      ),
//                    ),
//                    Text(
//                      "Profissão",
//                      style: TextStyle(
//                        color: Colors.grey[500],
//                      ),
//                    ),
//                    Text(
//                      "89.9",
//                      style: TextStyle(
//                        color: Colors.grey[500],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Padding(
//                  padding: EdgeInsets.only(left: 110, top: 20),
//                  child: RaisedButton(
//                    onPressed: () {},
//                    child: Text("Contratar"),
//                  )),
//            ],
//          ),
//        ],
//      ),
//    );
  }

  Widget getCard(context) {
    return Card(
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: SizedBox(
          height: 80.0,
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
                      //Icon(Icons.person, size: 60, color: Theme.of(context).primaryColor,),
                      Image.network(
                          "http://images.coveralia.com/autores/thumbs/belchior81574m.jpg"),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
//                    Text(
//                      "Cliente",
//                      style: TextStyle(fontSize: 16,),
//                    ),
//                    Text(
//                      "Maycon",
//                      style: TextStyle(color: Colors.grey, fontSize: 12,),
//                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Leonardo Beraldo",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
//                      Text(
//                        "14/08 - 13:30",
//                        style: TextStyle(color: Colors.grey, fontSize: 12,),
//                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "Pedreiro",
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(
                        height: 4,
                      ),
                      Text(
                        "100.0",
                        style: TextStyle(color: Colors.grey, fontSize: 12,),
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
                      RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        child: Text("CONTRATAR", style: TextStyle(color: Colors.white),),
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
