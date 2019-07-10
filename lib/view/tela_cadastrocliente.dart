import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Entre com seu nome completo',
                labelText: 'Nome',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Entre com seu endereço de email',
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key),
                hintText: 'Entre com a senha',
                labelText: 'Senha',
              ),
              obscureText: true,
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key),
                hintText: 'Repita a senha',
                labelText: 'Repitir Senha',
              ),
              obscureText: true,
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment),
                hintText: 'Entre com o CPF ou CNPJ',
                labelText: 'CPF/CNPJ',
              ),
              keyboardType: TextInputType.number,
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
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
