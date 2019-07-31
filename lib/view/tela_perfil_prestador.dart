import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pi/view/tab_agenda_prestador.dart';
import 'package:pi/view/tab_avaliacao_prestador.dart';
import 'package:pi/view/tab_perfil_prestador.dart';
import 'package:http/http.dart' as http;
import 'package:pi/view/tab_servicos_prestador.dart';
import 'dart:convert';
import 'package:pi/model/pessoa_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pi/view/tela_cadastro_prestador.dart';

////80% of screen width
//double c_width = MediaQuery.of(context).size.width*0.8;

class TelaPerfilPrestador extends StatefulWidget {
  final Map<String, dynamic> pessoa;
  final String cdgPessoa;

  TelaPerfilPrestador({this.pessoa, this.cdgPessoa});

  @override
  _TelaPerfilPrestadorState createState() =>
      _TelaPerfilPrestadorState(pessoa: pessoa, cdgPessoa: cdgPessoa);
}

class _TelaPerfilPrestadorState extends State<TelaPerfilPrestador> {
  Map<String, dynamic> pessoa;
  Map<String, dynamic> prestador;
  final String cdgPessoa;

  _TelaPerfilPrestadorState({this.pessoa, this.cdgPessoa});

  Future<Map> _getDadosPessoa(String cdgPessoa) async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa&codigo=$cdgPessoa&idTabela=cdgPessoa");
    return json.decode(response.body);
  }

  Future<Map> _getDadosPrestador(String cdgPessoa) async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=prestador&codigo=$cdgPessoa&idTabela=cdgPessoa");
    return json.decode(response.body);
  }

  Future<Map> _getDados() async {
    //se nao veio map com dados da pessoa
    if (pessoa == null) {
      //buscar dados pessoa pelo codigo via api
      pessoa = await _getDadosPessoa(cdgPessoa);
    }

    //pega dados do prestador
    prestador = await _getDadosPrestador(cdgPessoa);

//    pessoa = pessoa["pessoa"];
//    prestador = prestador["prestador"];
//
//    print("$pessoa");
//    print("${prestador}");

    return pessoa;

//    _getDados(cdgPessoa)
//        .then( (p) {
//      print("$p");
//          //{pessoa: [{cdgPessoa: 1, nome: Anderson, email: anderson_megax@hotmail.com, senha: senha123, cpfcnpj: 123123123, imagem: null}]}
//          pessoa = p;
//          print("${p["pessoa"][0]["nome"]}");
//          print("${p["pessoa"][0]["email"]}");
//    }
//    );
  }

  File _image;

  void getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image =
      await ImagePicker.pickImage(source: ImageSource.camera).then((file) {
        if (file == null)
          return;
        else {
          setState(() {
            //ToDo: persistir dados da imagem (upload imagem, etc)
            PessoaModel.of(context).salvarFoto(file);
            //PessoaModel.of(context).imagem = retornoUrl.toString();
          });
        }
      });
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
        if (file == null) {
          return;
        } else {
          setState(() {
            //ToDo: persistir dados da imagem (upload imagem, etc)
            // PessoaModel.of(context).imagem = retornoUrl.toString();
            PessoaModel.of(context).salvarFoto(file);
            print("HSVDUHSADVBAOILK");
          });
        }
      });
    }
    setState(() {
      print("HAHAHAHAHA");
      print(image);
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getDados(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                width: 200.0,
                height: 200.0,
                color: Colors.white,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                  strokeWidth: 10.0,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Container(
                  color: Colors.redAccent,
                );
              } else {
//                print("$pessoa");
//                print("${prestador}");
//                print("${("${pessoa}" == "{pessoa: []}" || "${prestador}" == "{prestador: []}")}");

                //ss pessoa ou prestador for nulo
                bool chamaCadastro = ("${pessoa}" == "{pessoa: []}" ||
                    "${prestador}" == "{prestador: []}");
                if (chamaCadastro) {
                  //print("chamar tela cadastro prestador");
                  //abre tela de cadastro do prestador
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: FlatButton(
                          child: Text(
                            "Prestador não cadastrado, CADASTRE!",
                          ),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaCadastroPrestador(
                                      pessoa["pessoa"][0]["cdgPessoa"])),
                            );
                          }),
                    ),
                  );
                } else {
                  print("mostrar tela de perfil");
                  //mostra tela de perfil

                  print("$pessoa");
                  print("${prestador}");
                  print(
                      "${prestador["prestador"]}"); //pessoa["pessoa"][0]["nome"]
                  print("${prestador["prestador"][0]}");
                  print("${prestador["prestador"][0]["notaPrestador"]}");
                  print("${pessoa["pessoa"][0]["imagem"]}");

                  return DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: GradientAppBar(
                        gradient: LinearGradient(colors: [
                          Color(0xFFb30000),
                          Color(0xFFcc0000),
                          Color(0xFFe60000),
                          Color(0xFFe60000),
                          Color(0xFFff0000),
                          Color(0xFFff0000),
                        ]),
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Center(
                            child: getTop(),
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.square(180.0),
                          child: getTabBar(),
                        ),
                      ),
                      body: getTabBarPages(),
                    ),
                  );
                }
              }
          }
        });
  }

  Widget getTabBar() {
    return TabBar(//controller: tabController,
        tabs: [
      Tab(
        text: "Perfil",
      ), //icon: Icon(Icons.perm_contact_calendar)
      Tab(
        text: "Serviços",
      ), //icon: Icon(Icons.calendar_today)
      Tab(
        text: "Avaliações",
      ), //icon: Icon(Icons.star)
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(//controller: tabController,
        children: <Widget>[

      TabPerfilPrestador(pessoa, prestador),
      //TabAgendaPrestador(),
      TabServicosPrestador(pessoa["pessoa"][0]["cdgPessoa"]),
      TabAvaliacaoPrestador(pessoa["pessoa"][0]["cdgPessoa"]),
    ]);
  }


  Widget getTop() {
    return Stack(
      children: <Widget>[
//        Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(top: 16.0),
//            ),
//            Row(
//              children: <Widget>[
//                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
//              ],
//            ),
//          ],
//        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 32.0),
                ),
//                CircleAvatar(
//                  radius: 60.0,
//                  backgroundColor: Colors.transparent,
//                  backgroundImage: ExactAssetImage( pessoa["pessoa"][0]["imagem"] ?? 'images/person.png'),
//                ),
                Stack(
                  children: <Widget>[

                    CircleAvatar(
                      child:
                          //se imagem nula ou em branco, coloca icone padrao
                          (pessoa["pessoa"][0]["imagem"] == null ||
                                  pessoa["pessoa"][0]["imagem"].length == 0)
                              ? CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: ExactAssetImage(
                                      pessoa["pessoa"][0]["imagem"]
                                      ??
                                      'images/person.png'),
                                )
//                      Icon(
//                              Icons.account_circle,
//                              size: 60,
//                              color: Theme.of(context).primaryColor,
//                            )

                              : //Image.network(pessoa["pessoa"][0]["imagem"]),

                              //container para deixar imagem circular
                              Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          pessoa["pessoa"][0]["imagem"]),
                                    ),
                                  ),
                                ),


                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),

                    //se pessoa logada for a mesma deste perfil, mostra botao editar foto
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: PessoaModel.of(context).cdgPessoa ==
                              pessoa["pessoa"][0]["cdgPessoa"]
                          ? FlatButton(
                              child: Icon(
                                Icons.edit,
                                color: Colors.red[800],
                              ),
                              onPressed: () {
                                _mostraOpcoes(context);
//                                ImagePicker.pickImage(
//                                        source: ImageSource.camera)
//                                    .then((file) {
//                                  if (file == null)
//                                    return;
//                                  else {
//                                    setState(() {
//                                      //ToDo: persistir dados da imagem (upload imagem, etc)
//                                      return PessoaModel.of(context).imagem =
//                                          file.path;
//                                    });
//                                  }
//                                });
                              },
                            )
                          : Container(color: Colors.transparent,),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  pessoa["pessoa"][0]["nome"] ?? "NOME DA PESSOA",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Prestador Serviços",
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  prestador["prestador"][0]["notaPrestador"] ?? "0",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }


  _mostraOpcoes(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  getImage(false);
                                  Navigator.pop(context);
                                });

                              },
                              child: Text(
                                "Galeria",
                                style: TextStyle(
                                    color: Color(0xFFcc0000), fontSize: 20.0),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  getImage(true);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Camera",
                                style: TextStyle(
                                    color: Color(0xFFcc0000), fontSize: 20.0),
                              )),
                        ),
                      ]),
                );
              });
        });
  }
}
