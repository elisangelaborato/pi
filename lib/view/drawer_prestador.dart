import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/tela_lista_agendamentos.dart';
import 'package:pi/view/tela_lista_avaliacoes.dart';
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
      MaterialPageRoute(builder: (context) => TelaPerfilPrestador(cdgPessoa: PessoaModel.of(context).cdgPessoa,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF000033),
              Color(0xFF000066),
              Color(0xFF000080),
              Color(0xFF0000b3),
              Color(0xFF0000e6),
              Color(0xFF0000ff),
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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaListaAgendamentos( cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa )));
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Avaliações"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaListaAvaliacoes( cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa )));
          },
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
