import 'package:flutter/material.dart';
import 'package:pi/services/autenticacao_firebase.dart';

////////Imports substituidos por rotas no main/////////
/*import 'package:pi/view/tela_principal_cliente.dart';
import 'package:pi/view/tela_principal_empresa.dart';
import 'package:pi/view/tela_cadastrocliente.dart';*/
///////////*************///////////////////////////

import 'package:firebase_auth/firebase_auth.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool isSwitched = true;


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {

    final _senhaController = TextEditingController();

    Auth auth = Auth();

    return Scaffold(
      key: _scaffoldKey,
//      appBar: AppBar(
//        title: Text("ALGUZ Serviços de A à Z"),
//        centerTitle: true,
//      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 55.0,
              ),


//              Icon(
//                Icons.account_circle,
//                size: 120.0,
//                color: Colors.blue,
//              ),
//              CircleAvatar(
//                child:
//                Image.asset('images/logo.png'),
//
////                Icon(Icons.person, size: 35, color: Theme.of(context).primaryColor,),
////                      Image.network(
////                          "https://image.flaticon.com/icons/png/512/10/10003.png"),
//                radius: 20,
//                backgroundColor: Colors.transparent,
//              ),

              Image.asset('images/logo.jpeg'),


              SizedBox(
                height: 0.0,
              ),
              Text(
                //"Welcome to ${UIData.appName}",
                "SERVIÇOS DE A á Z",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    //color: Theme.of(context).primaryColor,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              TextField(
                onChanged: (text){
                  _email = text;
                },
                decoration: const InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Digite seu login',
                  labelText: 'Login',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  //icon: const Icon(Icons.vpn_key),
                  hintText: 'Digite sua senha',
                  labelText: 'Senha',
                ),
                obscureText: true,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
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
                  ),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    "Prestador Serviço",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),

              Container(
                width: double.infinity,
                child: FlatButton(
                  shape: StadiumBorder(),
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    //ToDo: validar usuario e senha

                    //Login com o Firebase - Necessaria ativação na plataforma


                    auth.signIn(_email, _senhaController.text).then((String uid){
                      switch (selectedRadio) {
                        case 1:
                          {
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaPrincipalCliente()),
                            );*/

                            Navigator.of(context).pushReplacementNamed('/telaPrincipalCliente');
                            break;
                          }
                        case 2:
                          {
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaPrincipalEmpresa()),
                            );*/
                            Navigator.of(context).pushReplacementNamed('/telaPrincipalEmpresa');
                            break;
                          }
                      }
                    }).catchError((e){
                      print("DENTRO DO CATCH ERROR");
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("E-mail ou senha invalidos"),
                        backgroundColor: Colors.redAccent, duration: Duration(seconds: 3),));
                    });

                    //Navigator.pop(context);

                  },
                ),
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
                onTap: () {
                  if(_email ==  "" || _email == null){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Insira um email para recuperação"),
                      backgroundColor: Colors.redAccent, duration: Duration(seconds: 3),));
                  }else{
                    FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("E-mail de recuperação enviado"),
                      backgroundColor: Colors.greenAccent, duration: Duration(seconds: 3),));
                  }

                },
              ),

              GestureDetector(
                child: Container(
                  height: 30.0,
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                 /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaCadastro()),
                  );*/

                 Navigator.of(context).pushNamed('/telaCadastroCliente');
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
