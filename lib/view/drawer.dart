import 'package:flutter/material.dart';
import 'package:pi/view/tela_lista_agendamentos.dart';
import 'package:pi/view/tela_lista_avaliacoes.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_perfil_prestador.dart';
import 'package:pi/view/tela_cadastro_prestador.dart';
import 'package:pi/model/pessoa_model.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  chamarTelaPerfil() {
    //Navigator.pop(context);

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
            gradient: LinearGradient(
              colors: [
                Color(0xFF000033),
                Color(0xFF000066),
                Color(0xFF000080),
                Color(0xFF0000b3),
                Color(0xFF0000e6),
                Color(0xFF0000ff),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.center,
            ),
          ),
          accountName: Text(PessoaModel.of(context).nome),
          accountEmail: Text(PessoaModel.of(context).email),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundImage: ExactAssetImage("images/person.png"),
            ),
            onTap: () {
              // Navigator.pushNamed(context, '/telaPerfilCliente');
              chamarTelaPerfil();
            },
          ),
          onDetailsPressed: () {
            //Navigator.pushNamed(context,'/telaPerfilCliente');
            chamarTelaPerfil();
          },
        ),
        ListTile(
          leading: Icon(Icons.work),
          title: Text("Tornar-se um prestador"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaCadastroPrestador("2")),
            );

            //////TESTAR SE ESTA COMO PRESTADOR
            Navigator.of(context).pushNamed('/telaCadastroPrestador');
          },
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Histórico"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaListaAgendamentos(
                    cdgPessoa_cliente: "",
                    cdgPessoa_prestador: "",
                  )),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Avaliações"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaListaAvaliacoes(
                    cdgPessoa_cliente: "",
                    cdgPessoa_prestador: "",
                  )),
            );
          },
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
