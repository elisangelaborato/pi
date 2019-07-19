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
              child:
                  //se imagem nula ou em branco, coloca icone padrao
                  (PessoaModel.of(context).imagem == null ||
                          PessoaModel.of(context).imagem.length == 0)
                      ? CircleAvatar(
                          radius: 55.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: ExactAssetImage(
                              PessoaModel.of(context)
                                      .imagem //pessoa["pessoa"][0]["imagem"]
                                  ??
                                  'images/person.png'),
                        )
                      :
                      //container para deixar imagem circular
                      Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  PessoaModel.of(context).imagem),
                            ),
                          ),
                        ),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
            onTap: () {
              if (PessoaModel.of(context).isLogadoComoCliente()) {
                //Navigator.pushNamed(context, '/telaPerfilCliente');
                print("chamar  perfil cliente");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TelaPerfilCliente(

                          )),
                );
              }
              else
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaPerfilPrestador(
                        cdgPessoa: PessoaModel.of(context).cdgPessoa,
                      )),
                );
            },
          ),
          onDetailsPressed: () {
            if (PessoaModel.of(context).isLogadoComoCliente())
              Navigator.pushNamed(context, '/telaPerfilCliente');
            else
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaPerfilPrestador(
                          cdgPessoa: PessoaModel.of(context).cdgPessoa,
                        )),
              );
          },
        ),

        //////TESTAR SE ESTA COMO PRESTADOR
        //PessoaModel.of(context).isLogadoComoCliente() ?
        ListTile(
                leading: Icon(Icons.work),
                title: Text(PessoaModel.of(context).ativoPrestador == 1
                    ? PessoaModel.of(context).getModo() ?   "Ir para tela de Cliente" : "Ir para tela de Prestador"
                    : "Tornar-se Prestador"),
                onTap: () {
                  if (PessoaModel.of(context).ativoPrestador == 1) {
                    if(!PessoaModel.of(context).getModo()) {
                      PessoaModel.of(context).logadoComoPrestadorServicos(true);
                      Navigator.of(context).pushNamed('/telaPrincipalEmpresa');
                    }
                    else{
                      PessoaModel.of(context).logadoComoPrestadorServicos(false);
                      Navigator.of(context).pushNamed('/telaPrincipalCliente');
                    }

                  } else
                    Navigator.of(context).pushNamed('/telaCadastroPrestador');
                },
              ),
           /* : ListTile(
                leading: Icon(Icons.work),
                title: Text(PessoaModel.of(context).ativoCliente == 1
                    ? "Ir para tela de Cliente"
                    : "Tornar-se Cliente"),
                onTap: () {
                  if (PessoaModel.of(context).ativoCliente == 1) {
                    Navigator.of(context).pushNamed('/telaPrincipalCliente');
                  } else
                    Navigator.of(context).pushNamed('/telaCadastroCliente');
                },
              ),*/

        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Histórico"),
          onTap: () {
            if (PessoaModel.of(context).isLogadoComoCliente()) {
              //ve historico do cliente logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAgendamentos(
                            cdgPessoa_cliente:
                                PessoaModel.of(context).cdgPessoa,
                          )));
            } else {
              //ve historico do prestador logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAgendamentos(
                          cdgPessoa_prestador:
                              PessoaModel.of(context).cdgPessoa)));
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Avaliações"),
          onTap: () {
            //teste insercao de agendamento
            if (PessoaModel.of(context).isLogadoComoCliente()) {
              //ve historico do cliente logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAvaliacoes(
                            cdgPessoa_cliente:
                                PessoaModel.of(context).cdgPessoa,
                          )));
            } else {
              //ve historico do prestador logado
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaListaAvaliacoes(
                          cdgPessoa_prestador:
                              PessoaModel.of(context).cdgPessoa)));
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
