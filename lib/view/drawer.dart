import 'package:flutter/material.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_perfil_prestador.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  chamarTelaPerfil(){
    Navigator.pop(context);
    //ToDo: checar se esta como cliente ou como prestador de servicos
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => TelaPerfilCliente()),
//    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaPerfilPrestador()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
              UserAccountsDrawerHeader(
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

        ListTile(
          leading: Icon(Icons.work),
          title: Text("Tornar-se um prestador"),
          onTap: () {},
        ),
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
          onTap: () {},
        )
      ]),
    );
  }
}
