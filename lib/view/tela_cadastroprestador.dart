import 'package:flutter/material.dart';

class TelaCadastroPrestador extends StatefulWidget {
  @override
  _TelaCadastroPrestadorState createState() => _TelaCadastroPrestadorState();
}

class _TelaCadastroPrestadorState extends State<TelaCadastroPrestador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text  ("Cadastro Prestador", style: TextStyle(fontSize: 25.0),),
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
                labelText: "Função",
                labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration:InputDecoration(
                labelText: "CEP",
                labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
              ) ,
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Horario de Fucionamento",
                labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Sobre mim",
                labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                labelText: "Telefone",
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




