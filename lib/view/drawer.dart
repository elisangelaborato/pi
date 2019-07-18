import 'package:flutter/material.dart';
import 'package:pi/view/tela_lista_agendamentos.dart';
import 'package:pi/view/tela_lista_avaliacoes.dart';
import 'package:pi/view/tela_perfil_cliente.dart';
import 'package:pi/view/tela_perfil_prestador.dart';
import 'package:pi/view/tela_cadastro_prestador.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/model/servicos_model.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {



 /* chamarTelaPerfil(){
    //Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaPerfilCliente()),
    );
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => TelaPerfilPrestador()),
//    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF000033),
                        Color(0xFF000066),
                        Color(0xFF000080),
                        Color(0xFF0000b3),
                        Color(0xFF0000e6),
                        Color(0xFF0000ff),
                      ],
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                  ),
                ),
                accountName: Text(PessoaModel.of(context).nome),
                accountEmail: Text(PessoaModel.of(context).email),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage("images/person.png"),
                  ),
                  onTap: () {
                    if (PessoaModel.of(context).isLogadoComoCliente())
                      Navigator.pushNamed(context, '/telaPerfilCliente');
                    else
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaPerfilPrestador(cdgPessoa: PessoaModel.of(context).cdgPessoa,)),
                      );
                  },
                ),

                onDetailsPressed: () {
                  if (PessoaModel.of(context).isLogadoComoCliente())
                    Navigator.pushNamed(context, '/telaPerfilCliente');
                  else
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaPerfilPrestador(cdgPessoa: PessoaModel.of(context).cdgPessoa,)),
                    );
                },
              ),

        //////TESTAR SE ESTA COMO PRESTADOR
        PessoaModel.of(context).isLogadoComoCliente()
        ?
        ListTile(
          leading: Icon(Icons.work),
          title: Text(PessoaModel.of(context).ativoPrestador == 1 ? "Ir para tela de Prestador": "Tornar-se Prestador"),
          onTap: () {

            if(PessoaModel.of(context).ativoPrestador == 1){
              Navigator.of(context).pushNamed('/telaPrincipalEmpresa');
            }else
              Navigator.of(context).pushNamed('/telaCadastroPrestador');
          },
        )
        :
        ListTile(
          leading: Icon(Icons.work),
          title: Text(PessoaModel.of(context).ativoCliente == 1 ? "Ir para tela de Cliente": "Tornar-se Cliente"),
          onTap: () {

            if(PessoaModel.of(context).ativoCliente == 1){
              Navigator.of(context).pushNamed('/telaPrincipalCliente');
            }else
              Navigator.of(context).pushNamed('/telaCadastroCliente');
          },
        )
        ,

        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Histórico"),
          onTap: () {
            if (PessoaModel.of(context).isLogadoComoCliente()){
              //ve historico do cliente logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAgendamentos( cdgPessoa_cliente: PessoaModel.of(context).cdgPessoa, )));
            }else{
              //ve historico do prestador logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAgendamentos( cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa )));
            }
            //PessoaModel.of(context).salvaPessoa();
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Avaliações"),
          onTap: () {
            //teste insercao de agendamento
            //ServicosModel.of(context).salvaAgendamento("39", "39", "1", "2019-07-18", "08:30", "AGUARDANDO", "20.00");

            if (PessoaModel.of(context).isLogadoComoCliente()){
              //ve historico do cliente logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAvaliacoes( cdgPessoa_cliente: PessoaModel.of(context).cdgPessoa, )));
            }else{
              //ve historico do prestador logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAvaliacoes( cdgPessoa_prestador: PessoaModel.of(context).cdgPessoa )));
            }
          },
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Sair"),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        )
      ]),
    );
  }
}
