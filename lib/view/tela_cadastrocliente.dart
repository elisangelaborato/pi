import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pi/services/autenticacao_firebase.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _nomeController           = TextEditingController();
  final _emailController          = TextEditingController();
  final _senhaController          = TextEditingController();
  final _senhaConfirmController   = TextEditingController();
  final _cpfControllerMascara     = MaskedTextController(mask: '000.000.000-00');

  final _telefoneControllerMascara= MaskedTextController(mask: '(00) 0 0000-0000');

  String _urlCadastro;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cliente"),
        centerTitle: false,
      ),
      body: getForm(),
//      body: SingleChildScrollView(
//        child: Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16.0),
//          child: Column(
//            children: <Widget>[
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Login",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "E-mail",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Senha",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Repetir Senha",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "CPF/CNPJ",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 40.0,
//              ),
//              RaisedButton(
//                padding: EdgeInsets.only(
//                    top: 08.0, left: 08.0, right: 08.0, bottom: 08.0),
//                color: Colors.black38,
//                child: Text(
//                  "Cadastrar",
//                  style: TextStyle(fontSize: 25.0),
//                ),
//                onPressed: () {},
//              ),
//            ],
//          ),
//        ),
//      ),
    );
  }

  Widget getForm() {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Entre com seu nome completo',
                labelText: 'Nome',
              ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o nome';
                  }
                }
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Entre com seu endereço de email',
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o e-mail';
                  }
                }
            ),
            TextFormField(
              controller: _senhaController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key),
                hintText: 'Entre com a senha',
                labelText: 'Senha',
              ),
              obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com a senha';
                  }
                }
            ),
            TextFormField(
              controller: _senhaConfirmController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key),
                hintText: 'Repita a senha',
                labelText: 'Repitir Senha',

              ),
              obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com a senha';
                  }
                }
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
                controller: _cpfControllerMascara,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assignment),
                  hintText: 'Entre com o CPF ou CNPJ',
                  labelText: 'CPF/CNPJ',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o CPF';
                  }
                }
                ),
            TextFormField(
                controller: _telefoneControllerMascara,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Entre com o Telefone',
                  labelText: 'Telefone',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o telefone';
                  }
                }
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              //padding: const EdgeInsets.only(left: 40.0, top: 20.0),
              width: double.infinity,
              child: new RaisedButton(
                shape: StadiumBorder(),
                child: const Text(
                  'CADASTRAR',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //chama a api para cadastro de pessoa
                    _urlCadastro="http://alguz1.gearhostpreview.com/cadastra_pessoa.php?nome=${_nomeController.text}&email=${_emailController.text}&senha=${_senhaController.text}&cpfcnpj=${_cpfControllerMascara.text}&telefone=${_telefoneControllerMascara.text}";

                    //////////*******CRIANDO USUARIO NO FIREBASE - PRECISA HABILITAR - ********/////////////////////
                    //print(auth.signUp(_emailController.text, _senhaController.text));
                    /////////******************************////////////////////


                    //Cria um registro com todos os dados no banco de dados no gearhost
                    _launchURL(_urlCadastro);

                    //se tiver sucesso ao cadastrar ir para a tela principal cliente
                    Navigator.of(context).pushReplacementNamed('/telaPrincipalCliente');
                  }
                },
              ),
            ),
          ],
        ));
  }
}


//Metodo para criacao de registro de usuario no banco de dados da gearhost
_launchURL(String url) async {
  var response = await http.post(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print("Number of books about http: $itemCount.");
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
}
