import 'package:flutter/material.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  bool isSwitched = true;

  int selectedRadio;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nome Projeto"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Icon(Icons.account_circle,
             size: 120.0,
             color: Colors.blue,
           ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 20, 0, 20),
                labelText: "Login",
                hintText: "Digite seu Login",
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
           TextFormField(
             decoration: InputDecoration(
               contentPadding: EdgeInsets.fromLTRB(5, 20, 0, 20),
               labelText: "Senha",
               hintText: "Digite sua senha",
               labelStyle: TextStyle(
                   color: Colors.black87,
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold),
             ),
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Switch(
                  value: isSwitched,
                  onChanged: (value){
                    setState((){
                      isSwitched = value;
                    });
                  },
                ),
                Padding(
                  child: Text("Salvar senha"),
                  padding: EdgeInsets.only(right: 20),
                ),
              ],
            ),
            FlatButton(
              child: Text("Entrar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.grey,
              onPressed: (){

              },
            ),
           FlatButton(
             child:   Text("Esqueci minha senha",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 18,
                 color: Colors.black
               ),
             ),
             onPressed: (){

             },
             padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
           ),
           FlatButton(
             child:   Text("Cadastrar-se",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 18
               ),
             ),
             onPressed: (){

             },
             padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
           ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Radio(
                     value: 1,
                     groupValue: selectedRadio,
                     activeColor: Colors.blue,
                     onChanged: (val){
                       print("Radio $val");
                       setSelectedRadio(val);
                     },
                   ),
                   Text("Prestador de Serviço",
                     style: TextStyle(
                         fontSize: 15,
                     ),
                   )
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Radio(
                     value: 2,
                     groupValue: selectedRadio,
                     activeColor: Colors.blue,
                     onChanged: (val){
                       print("Radio $val");
                       setSelectedRadio(val);
                     },
                   ),
                   Text("Cliente",
                     style: TextStyle(
                     fontSize: 15,
                   ),)
                 ],
               ),
             ],
           ),
           ),
        );
  }
}
