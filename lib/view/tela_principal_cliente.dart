import 'package:flutter/material.dart';
import 'package:pi/view/drawer.dart';

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
                  text: "Meus Serviços",
                ),
              ],
            ),
            title: Text('Nome da Empresa'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(),//Drawer(),
          body: TabBarView(
            children: [
              ServicosWidget(),
              PrestadoresWidget(),
              MeusServicosTesteLinha(),
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
            child: Image.network(
                "http://pontoemcomumseguros.com.br/images/icones/lifeline-in-a-heart-outline.png"),
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
            child: Image.network(
                "https://library.kissclipart.com/20180831/wcw/kissclipart-icone-professor-png-clipart-teacher-computer-icons-be63703f059606a5.png"),
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
            child: Image.network(
                "http://download.seaicons.com/icons/icons8/windows-8/512/Transport-Construction-Worker-icon.png"),
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
            child: Image.network(
                "https://image.flaticon.com/icons/png/512/40/40546.png"),
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
            child: Image.network(
                "https://image.flaticon.com/icons/png/512/34/34100.png"),
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
            child: Image.network("https://www.lojsnovi.com.br/img/outro.png"),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
                radius: 35,
                backgroundColor: Colors.transparent,
              ),
              Text("Profissional", style: TextStyle(fontSize: 20),),
              Text("Maycon", style: TextStyle(color: Colors.grey),),
            ],
          ),
          Column(
            children: <Widget>[
              Text("Data/Hora", style: TextStyle(fontSize: 20),),
              Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
              Divider(
                height: 30,
              ),
              Text("Valor", style: TextStyle(fontSize: 20),),
              Text("R\$80,00", style: TextStyle(color: Colors.grey),),
            ],
          ),
          Column(
            children: <Widget>[
            Divider(
              height: 60,
            ),
              RaisedButton(
                  onPressed: (){},
                  child: Text("Cancelar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MeusServicosTesteLinha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Image.network(
                "https://image.flaticon.com/icons/png/512/10/10003.png"),
            radius: 35,
            backgroundColor: Colors.transparent,
          ),
         Padding(padding: EdgeInsets.only(left: 80, top: 20),
         child: Column(

           children: <Widget>[
             Text("Dia/Hora", style: TextStyle(fontSize: 20),),
             Text("14/08 - 13:30", style: TextStyle(color: Colors.grey),),
           ],
         ) ,
         ),


        ],
      ),
    );
  }
}


class PrestadoresWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/10/10003.png"),
                radius: 35,
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Nome",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Profissão",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      "89.9",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 110, top: 20),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Contratar"),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
