import 'package:flutter/material.dart';
import 'package:pi/view/tela_cadastrocliente.dart';
import 'package:pi/model/pessoa_model.dart';

class TabPerfilCliente extends StatefulWidget {
  @override
  _TabPerfilClienteState createState() => _TabPerfilClienteState();
}

class _TabPerfilClienteState extends State<TabPerfilCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaCadastro()),
          );
        },
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sobre mim",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                PessoaModel.of(context).sobreMimCliente ?? "Adicione um texto falando um pouco sobre você",
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Telefone",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                PessoaModel.of(context).telefoneCliente,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                PessoaModel.of(context).email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
