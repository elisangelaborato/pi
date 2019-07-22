import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pi/view/tab_agenda_cliente.dart';
import 'package:pi/view/tab_avaliacao_cliente.dart';
import 'package:pi/view/tab_perfil_cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pi/model/pessoa_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

////80% of screen width
//double c_width = MediaQuery.of(context).size.width*0.8;

class TelaPerfilCliente extends StatefulWidget {
  final Map<String, dynamic> pessoa;
  final String cdgPessoa;

  TelaPerfilCliente({this.pessoa, this.cdgPessoa});

  @override
  _TelaPerfilClienteState createState() => _TelaPerfilClienteState();
}

class _TelaPerfilClienteState extends State<TelaPerfilCliente> {
  final Map<String, dynamic> pessoa;
  final String cdgPessoa;

  _TelaPerfilClienteState({this.pessoa, this.cdgPessoa});

/*  Future<Map> _getDados() async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa");
    print(response.body);
    return json.decode(response.body);
  }*/

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
//    return Scaffold(
//      body: getTop(),
//    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: GradientAppBar(
          gradient: LinearGradient(colors: [
            Color(0xFF000033),
            Color(0xFF000066),
            Color(0xFF000080),
            Color(0xFF0000b3),
            Color(0xFF0000e6),
            Color(0xFF0000ff),
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

  Widget getTabBar() {
    return TabBar(//controller: tabController,
        tabs: [
      Tab(
        text: "Perfil",
      ), //icon: Icon(Icons.perm_contact_calendar)
      Tab(
        text: "Agenda",
      ), //icon: Icon(Icons.calendar_today)
      Tab(
        text: "Avaliações",
      ), //icon: Icon(Icons.star)
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(//controller: tabController,
        children: <Widget>[
      TabPerfilCliente(), //Container(color: Colors.amber,),
      TabAgendaCliente(
          PessoaModel.of(context).cdgPessoa), //Container(color: Colors.red,),
      TabAvaliacaoCliente(
          PessoaModel.of(context).cdgPessoa), //Container(color: Colors.blue,),
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
//                  backgroundImage: ExactAssetImage('images/person.png'),
//                ),
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      child:
                          //se imagem nula ou em branco, coloca icone padrao
//                      (pessoa["pessoa"][0]["imagem"] == null ||
//                          pessoa["pessoa"][0]["imagem"].length == 0)
                          (PessoaModel.of(context).imagem == null ||
                                  PessoaModel.of(context).imagem.length == 0)
                              ? CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: ExactAssetImage(PessoaModel
                                              .of(context)
                                          .imagem //pessoa["pessoa"][0]["imagem"]
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
                                          //pessoa["pessoa"][0]["imagem"]
                                          PessoaModel.of(context).imagem),
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
                              PessoaModel.of(context)
                                  .cdgPessoa //pessoa["pessoa"][0]["cdgPessoa"]
                          ? FlatButton(
                              child: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                              //mini: true,
                              onPressed: () {
                                _mostraOpcoes(context);
//                          ImagePicker.pickImage(
//                              source: ImageSource.camera)
//                              .then((file) {
//                            if (file == null)
//                              return;
//                            else {
//                              setState(() {
//                                //ToDo: persistir dados da imagem (upload imagem, etc)
//                                return PessoaModel
//                                    .of(context)
//                                    .imagem =
//                                    file.path;
//                              });
//                            }
//                          });
                              },
                            )
                          : Container(
                              color: Colors.transparent,
                            ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  PessoaModel.of(context).nome,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
//                Text(
//                  "Cliente Platinum",
//                  style: TextStyle(fontSize: 15.0),
//                ),
                Text(
                  PessoaModel.of(context).notaCliente,
                  style: TextStyle(fontSize: 15.0),
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
                                    color: Color(0xFF000066), fontSize: 20.0),
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
                                    color: Color(0xFF000066), fontSize: 20.0),
                              )),
                        ),
                      ]),
                );
              });
        });
  }
}
