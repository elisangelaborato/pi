import 'package:flutter/material.dart';
import 'package:pi/view/tela_cadastro_prestador.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_perfil_prestador.dart';
import 'package:pi/view/tela_login.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  chamarTelaPerfil() {
    //Navigator.pop(context);
    //ToDo: checar se esta como cliente ou como prestador de servicos
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaPerfilCliente()),
    );
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => TelaPerfilPrestador()),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xff000080),
              const Color(0xff0000ff),
              const Color(0xff0086b3),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          accountName: Text("Login"),
          accountEmail: Text("login@gmail.com"),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
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
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TelaCadastroPrestador()));
          },
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
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/tela_login');
          },
        )
      ]),
    );
  }
}
