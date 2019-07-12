import 'package:flutter/material.dart';
import 'package:pi/view/tela_login.dart';
import 'view/tela_principal_cliente.dart';
import 'view/tela_cadastrocliente.dart';
import 'package:pi/view/tela_principal_empresa.dart';
import 'package:pi/view/tela_cadastroprestador.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_agendamento_cliente.dart';

void main(){
  runApp(MaterialApp(
    //home: TelaLogin(),
    debugShowCheckedModeBanner: false,

    initialRoute: '/',
    routes: {
      //Rota para a tela de login
      '/': (context) => TelaLogin(),

      //Rota para a tela principal do cliente
      '/telaPrincipalCliente': (context)  => TelaPrincipalCliente(),

      //Rota para tela de cadastro de cliente
      '/telaCadastroCliente': (context)   => TelaCadastro(),

      //Rota para tela de perfil do cliente
      '/telaPerfilCliente': (context)     => TelaPerfilCliente(),

      //Rota para a tela de agendamento de serviços
      '/telaAgendamentoCliente': (context)=> TelaAgendamentoCliente(),

      //Rota para a tela principal de prestador de serviços
      '/telaPrincipalEmpresa': (context)  => TelaPrincipalEmpresa(),

      //Rota pra tela de cadastro de prestador de serviços
      '/telaCadastroPrestador': (context) => TelaCadastroPrestador()
    },
  ));
}


