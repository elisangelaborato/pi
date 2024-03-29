import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/services/autenticacao_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pi/model/pessoa_model.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool isSwitched = true;
  bool _ocultarSenha = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;
  String _senha;

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

    //final _senhaController = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 55.0,
              ),
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

                 // icon: const Icon(Icons.person),
                  hintText: 'Digite seu login',
                  labelText: 'Login',
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              TextField(
                onChanged: (text){
                  _senha = text;
                },
                decoration:  InputDecoration(
                  //icon: const Icon(Icons.person),
                  hintText: 'Digite sua senha',
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                     icon:  _ocultarSenha ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    onPressed: (){
                      setState(() {
                        if(_ocultarSenha == false)
                          _ocultarSenha = true;
                        else
                          _ocultarSenha = false;
                      });
                    },
                  ),
                ),
                obscureText: _ocultarSenha,
              ),
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
                  GestureDetector(
                    child: Padding(
                      child: Text("Salvar senha"),
                      padding: EdgeInsets.only(right: 20),
                    ),
                    onTap: (){
                      setState(() {
                        if(isSwitched == true){
                          isSwitched = false;
                        }
                        else{
                          isSwitched = true;
                        }
                      });
                    },
                  ),

                ],
              ),
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
                  GestureDetector(
                    child: Text(
                      "Cliente",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        setSelectedRadio(1);
                      });
                    }
                  ),

                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      "Prestador Serviço",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        setSelectedRadio(2);
                      });
                    },
                  ),

                ],
              ),

              GradientButton(
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
                child: Text("ENTRAR", style: TextStyle(fontSize: 20.0),),
                callback: () {
                  _onPressedButtonEntrar();
//                  Navigator.of(context).pushNamed('/telaPrincipalCliente');
                },
                increaseWidthBy: 190.0,
              ),

//              Container(
//                width: double.infinity,
//                child: FlatButton(
//                  shape: StadiumBorder(),
//                  child: Text(
//                    "ENTRAR",
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),
//                  ),
//                  color: Theme.of(context).primaryColor,
//                  onPressed: () {
//                    _onPressedButtonEntrar();
//                  },
//                ),
//              ),

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
                  Navigator.of(context).pushNamed('/telaCadastroCliente');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedButtonEntrar() async {
    if (_email.contains('@')) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Auth auth = Auth();
        //Login com o Firebase
        auth.signIn(_email, _senha).then((String uid) {
          PessoaModel.of(context).getDados(uid);
          PessoaModel.of(context).Logar(true);
          PessoaModel.of(context).logadoComoCliente(true);
          PessoaModel.of(context).logadoComoPrestadorServicos(false);

          switch (selectedRadio) {
            case 1:
              PessoaModel.of(context).logadoComoCliente(true);
              Navigator.of(context).pushReplacementNamed(
                  '/telaPrincipalCliente');
              break;
            case 2:
              PessoaModel.of(context).logadoComoPrestadorServicos(true);
              Navigator.of(context).pushReplacementNamed(
                  '/telaPrincipalEmpresa');
              break;
          }
        }).catchError((e) {
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text("E-mail ou senha invalidos"),
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 3),));
        });
      } else {
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text("Não há conexão com a internet"),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 3),));
      }
    }
    else{
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("E-mail invalido"),
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 3),));
    }
  }
}
