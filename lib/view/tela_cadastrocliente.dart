import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text  ("Cadastro", style: TextStyle(fontSize: 25.0),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "Login",
              labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
            ),
          ),
          SizedBox(height: 20.0,),
          TextField(
            decoration:InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
            ) ,
          ),
          SizedBox(height: 20.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
            ),
          ),
          SizedBox(height: 20.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "Repetir Senha",
              labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
            ),
          ),
          SizedBox(height: 20.0,),
          TextField(
            decoration: InputDecoration(
              labelText: "CPF/CNPJ",
              labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
            ),
    ),
          SizedBox(height: 40.0,),
          RaisedButton(
            padding: EdgeInsets.only(
                top: 08.0, left: 08.0, right: 08.0, bottom: 08.0),
            color: Colors.black38,
            child: Text("Cadastrar", style: TextStyle(fontSize: 25.0),),

             onPressed: () {
            },
          ),
        ],
        ),
      ),
      ),
    );
  }
}

