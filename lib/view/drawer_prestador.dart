import 'package:flutter/material.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_perfil_prestador.dart';

class DrawerPrestador extends StatefulWidget {
  @override
  _DrawerPrestadorState createState() => _DrawerPrestadorState();
}

class _DrawerPrestadorState extends State<DrawerPrestador> {

  chamarTelaPerfil(){
    //Navigator.pop(context);

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => TelaPerfilCliente()),
//    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaPerfilPrestador(cdgPessoa: "2",)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF000080),
              Color(0xFF3333ff),
            ])
          ),
          accountName: Text("Login"),
          accountEmail: Text("login@gmail.com"),
          currentAccountPicture: GestureDetector(
            child:                 CircleAvatar(
              backgroundImage: ExactAssetImage("images/person.png"),
            ),
            onTap: () {
              chamarTelaPerfil();
            },
          ),

          onDetailsPressed: () {
            chamarTelaPerfil();
          },
        ),

//        ListTile(
//          leading: Icon(Icons.work),
//          title: Text("Tornar-se um prestador"),
//          onTap: () {},
//        ),

        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Histórico"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Avaliações"),
          onTap: () {},
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Sair"),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        )
      ]),
    );
  }
}
