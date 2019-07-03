import 'package:flutter/material.dart';
import 'package:pi/view/tela_principal_cliente.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool isSwitched = true;

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
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
        child: Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 120.0,
                color: Colors.blue,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Digite seu login',
                  labelText: 'Login',
                ),
                //keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  //icon: const Icon(Icons.vpn_key),
                  hintText: 'Digite sua senha',
                  labelText: 'Senha',
                ),
                //keyboardType: TextInputType.emailAddress,
              ),

//            TextFormField(
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.fromLTRB(5, 20, 0, 20),
//                labelText: "Login",
//                hintText: "Digite seu Login",
//                labelStyle: TextStyle(
//                    color: Colors.black87,
//                    fontSize: 25.0,
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//           TextFormField(
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(5, 20, 0, 20),
//               labelText: "Senha",
//               hintText: "Digite sua senha",
//               labelStyle: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
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
//              Container(
//                  padding: const EdgeInsets.only(left: 40.0, top: 20.0),
//                  child: RaisedButton(
//                    child: const Text('Confirmar', style: TextStyle(color: Colors.white),),
//                    color: Theme.of(context).primaryColor,
//                    onPressed: () {},
//                  )),

              FlatButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  //ToDo: validar usuario e senha
                  //ToDo: testar se esta checado para entrar como cliente ou prestador
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPrincipalCliente()),
                  );
                },
              ),

              SizedBox(
                height: 15.0,
              ),

              GestureDetector(
                child: Container(
                  height: 30.0,
                  child: Text(
                    "Esqueci minha senha?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () { },
              ),

              GestureDetector(
                child: Container(
                  height: 30.0,
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () { },
              ),

//              FlatButton(
//                child: Text(
//                  "Esqueci minha senha",
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 16,
//                      color: Colors.black),
//                ),
//                onPressed: () {},
//                //padding: EdgeInsets.fromLTRB(0, 20, 20, 15),
//              ),
//
//              FlatButton(
//                child: Text(
//                  "Cadastrar-se",
//                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                ),
//                onPressed: () {},
//                //padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
//              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    "Prestador de Serviço",
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
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    "Cliente",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
