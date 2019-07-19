import 'package:flutter/material.dart';
import 'package:pi/view/tab_avaliacao_cliente.dart';
import 'package:pi/view/tab_avaliacao_prestador.dart';
import 'package:pi/view/tela_cadastro_servico.dart';
import 'package:pi/view/tela_login.dart';
import 'view/tela_principal_cliente.dart';
import 'view/tela_cadastro_cliente.dart';
import 'package:pi/view/tela_principal_empresa.dart';
import 'package:pi/view/tela_cadastro_prestador.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/drawer.dart';
import 'package:pi/model/servicos_model.dart';

void main(){
  runApp(
    ScopedModel<PessoaModel>
      (model: PessoaModel(),
        child: ScopedModelDescendant<PessoaModel>
          (builder: (context, child, model){
          return ScopedModel<ServicosModel>(
              model: ServicosModel(),
              child: MaterialApp(
                theme: ThemeData(primaryColor: Color(0xFF000080)),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: generateRoute,
                initialRoute: '/telaPrincipalEmpresa',
              ));
        })),
  );
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
    case '/drawer':
      return MaterialPageRoute(builder: (_) => CustomDrawer());
      break;
    case '/telaCadastroServico':
      return MaterialPageRoute(builder: (_) => TelaCadastroServico());
      break;
//    case '/tabAvaliacaoCliente':
//      return MaterialPageRoute(builder: (_) => TabAvaliacaoCliente());
//      break;
//    case '/tabAvaliacaoPrestador':
//      return MaterialPageRoute(builder: (_) => TabAvaliacaoPrestador());
//      break;
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
