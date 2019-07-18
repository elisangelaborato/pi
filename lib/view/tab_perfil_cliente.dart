import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/view/tela_cadastro_cliente.dart';
import 'package:pi/model/pessoa_model.dart';

class TabPerfilCliente extends StatefulWidget {
  @override
  _TabPerfilClienteState createState() => _TabPerfilClienteState();
}

class _TabPerfilClienteState extends State<TabPerfilCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,16,5,16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sobre mim",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                PessoaModel.of(context).sobreMimCliente ??
                    "Adicione um texto falando um pouco sobre você",
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Telefone",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                PessoaModel.of(context).telefoneCliente,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                PessoaModel.of(context).email,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(310, 170, 0, 10),
                  child:CircularGradientButton(

                  gradient: LinearGradient(colors: [
                    Color(0xFF000033),
                    Color(0xFF000066),
                    Color(0xFF000080),
                    Color(0xFF0000b3),
                    Color(0xFF0000e6),
                    Color(0xFF0000ff),
                  ]
                  ),
                  child: Icon(Icons.edit),
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaCadastro()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

