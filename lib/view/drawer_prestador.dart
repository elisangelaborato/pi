import 'package:flutter/material.dart';
import 'package:pi/view/tela_cadastro_servico.dart';
import 'package:pi/view/tela_login.dart';
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
              const Color(0xff000080),
              const Color(0xff0000ff),
              const Color(0xff0086b3),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
          leading: Icon(Icons.add_box),
          title: Text("Cadastrar Serviço"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TelaCadastroServico()));
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
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Configurações"),
          onTap: () {

          },
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Sair"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TelaLogin()));
          },
        )
      ]),
    );
  }
}
