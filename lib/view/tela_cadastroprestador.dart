import 'package:flutter/material.dart';

class TelaCadastroPrestador extends StatefulWidget {
  @override
  _TelaCadastroPrestadorState createState() => _TelaCadastroPrestadorState();
}

class _TelaCadastroPrestadorState extends State<TelaCadastroPrestador> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prestador de Serviços",
        ),
        centerTitle: false,
      ),
      body: getForm(),
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
                icon: const Icon(Icons.donut_large),
                hintText: 'Informe a função',
                labelText: 'Função',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Entre com seu CEP',
                labelText: 'CEP',
              ),
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.access_time),
                hintText: 'Entre com horário de funcionamento',
                labelText: 'Horário de funcionamento',
              ),
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.list),
                hintText: 'Entre com informações sobre você',
                labelText: 'Sobre mim',
              ),
              //keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Entre com seu telefone',
                labelText: 'Telefone',
              ),
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
                  'CADASTRAR',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {

                },
              ),
            ),
          ],
        ));
  }
}
