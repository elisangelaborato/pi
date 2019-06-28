import 'package:flutter/material.dart';
import 'view/tela_principal_cliente.dart';
import 'view/tela_principal_empresa.dart';

void main(){
  runApp(MaterialApp(
    home: TelaPrincipalEmpresa(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

