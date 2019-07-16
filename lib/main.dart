import 'package:flutter/material.dart';
import 'package:pi/view/Teste.dart';
import 'package:pi/view/drawer.dart';
import 'package:pi/view/tela_cadastro_servico.dart';
import 'package:pi/view/tela_cadastro_cliente.dart';
import 'package:pi/view/tela_cadastro_prestador.dart';
import 'package:pi/view/tela_login.dart';
import 'package:pi/view/tela_perfil_prestador.dart';

void main(){
  runApp(MaterialApp(
    home: TelaLogin(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/tela_login': (BuildContext context) => TelaLogin(),
      '/tela_cadastroprestador': (BuildContext context) => TelaCadastroPrestador(),
    }
  )
  );
}


