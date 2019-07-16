import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TelaCadastroPrestador extends StatefulWidget {
  @override
  _TelaCadastroPrestadorState createState() => _TelaCadastroPrestadorState();
}

class _TelaCadastroPrestadorState extends State<TelaCadastroPrestador> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var _maskedTel = new MaskedTextController(mask: '(00)00000-0000');

  var _maskedCep = new MaskedTextController(mask: '00000-000');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(

        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff0086b3),
              const Color(0xff0000FF),
              const Color(0xff0086b3),
            ],
        ),
        title: Text("Prestador de Serviços"),
        centerTitle: true,
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
//                  labelText: "Função",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "CEP",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Horario de Fucionamento",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Sobre mim",
//                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              TextField(
//                decoration: InputDecoration(
//                  labelText: "Telefone",
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
                icon: const Icon(Icons.email),
                hintText: 'Entre com seu CEP',
                labelText: 'CEP',
              ),
              controller: _maskedCep,
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.list),
                hintText: 'Entre com informações sobre você',
                labelText: 'Sobre mim',
              ),
              maxLength: 200,
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: '(99)99999-9999',
                labelText: 'Telefone',
              ),
              controller: _maskedTel,
              //keyboardType: TextInputType.number,
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
                  'FINALIZAR',
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
