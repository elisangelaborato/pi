import 'package:flutter/material.dart';
import 'package:pi/view/tela_perfil_cliente.dart';

void main(){
  runApp(MaterialApp(
    home: TelaPerfilCliente(),
    debugShowCheckedModeBanner: false,
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

