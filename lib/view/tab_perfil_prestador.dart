import 'package:flutter/material.dart';
import 'package:pi/view/tela_cadastroprestador.dart';

class TabPerfilPrestador extends StatefulWidget {

  final Map<String, dynamic> pessoa;
  final Map<String, dynamic> prestador;

  TabPerfilPrestador(this.pessoa, this.prestador);

  @override
  _TabPerfilPrestadorState createState() => _TabPerfilPrestadorState(pessoa, prestador);
}

class _TabPerfilPrestadorState extends State<TabPerfilPrestador> {

  final Map<String, dynamic> pessoa;
  final Map<String, dynamic> prestador;

  _TabPerfilPrestadorState(this.pessoa, this.prestador);

  @override
  Widget build(BuildContext context) {

    print("xxx $pessoa");
    print("xxx $prestador");

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaCadastroPrestador(pessoa["pessoa"][0]["cdgPessoa"])),
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
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  prestador["prestador"][0]["sobreMim"] ?? "",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                ),
//                Text(
//                  "Especialidades",
//                  style: TextStyle(fontSize: 18),
//                ),
//                Text(
//                  "Eletricista; encanador; marceneiro; pedreiro.",
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 16.0),
//                ),
                Text(
                  "Telefone",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  prestador["prestador"][0]["telefone"] ?? "",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  pessoa["pessoa"][0]["email"] ?? "",
                ),
              ],
            ),
          ),
        ),
    );
  }
}
