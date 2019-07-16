import 'package:flutter/material.dart';
import 'package:pi/view/tela_login.dart';
import 'view/tela_principal_cliente.dart';
import 'view/tela_cadastrocliente.dart';
import 'package:pi/view/tela_principal_empresa.dart';
import 'package:pi/view/tela_cadastroprestador.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_agendamento_cliente.dart';
import 'package:pi/view/drawer.dart';

void main() {
  runApp(MaterialApp(
    //home: TelaLogin(),
    debugShowCheckedModeBanner: false,

    onGenerateRoute: generateRoute,
    initialRoute: '/',
   /* routes: <String, WidgetBuilder>{
      //Rota para a tela de login
      '/': (context) => TelaLogin(),
      //Rota para a tela principal do cliente
      '/telaPrincipalCliente': (BuildContext context) => TelaPrincipalCliente(),

      //Rota para tela de cadastro de cliente
      '/telaCadastroCliente': (BuildContext context) => TelaCadastro(),

      //Rota para tela de perfil do cliente
      '/telaPerfilCliente': (BuildContext context) => TelaPerfilCliente(),

      //Rota para a tela de agendamento de serviços
      '/telaAgendamentoCliente': (BuildContext context) =>
          TelaAgendamentoCliente(),

      //Rota para a tela principal de prestador de serviços
      '/telaPrincipalEmpresa': (BuildContext context) => TelaPrincipalEmpresa(),

      //Rota pra tela de cadastro de prestador de serviços
      '/telaCadastroPrestador': (BuildContext context) =>
          TelaCadastroPrestador()
    },*/
  ));
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => TelaLogin());
      break;
    case '/telaPrincipalCliente':
      return MaterialPageRoute(builder: (_) => TelaPrincipalCliente());
      break;
    case '/telaPrincipalEmpresa':
      return MaterialPageRoute(builder: (_) => TelaPrincipalEmpresa());
      break;
    case '/telaPerfilCliente':
      return MaterialPageRoute(builder: (_) => TelaPerfilCliente());
      break;
    case '/telaCadastroPrestador':
      return MaterialPageRoute(builder: (_) => TelaCadastroPrestador(""));
      break;
    case '/telaCadastroCliente':
      return MaterialPageRoute(builder: (_) => TelaCadastro());
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
