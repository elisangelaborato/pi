import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pi/services/autenticacao_firebase.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/model/pessoa_model.dart';

class TelaCadastroPrestador extends StatefulWidget {
  final String cdgPessoa;

  TelaCadastroPrestador(this.cdgPessoa);

  @override
  _TelaCadastroPrestadorState createState() =>
      _TelaCadastroPrestadorState(cdgPessoa);
}

class _TelaCadastroPrestadorState extends State<TelaCadastroPrestador> {
  final String cdgPessoa;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool seg = false,
      ter = false,
      quar = false,
      quin = false,
      sex = false,
      sab = false,
      dom = false;
  bool segTarde = false,
      terTarde = false,
      quarTarde = false,
      quinTarde = false,
      sexTarde = false,
      sabTarde = false,
      domTarde = false;
  bool segManha = false,
      terManha = false,
      quarManha = false,
      quinManha = false,
      sexManha = false,
      sabManha = false,
      domManha = false;

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmController = TextEditingController();
  final _sobreMimPrestadorController = TextEditingController();

  final MaskedTextController _cpfControllerMascara =
      MaskedTextController(mask: '00.000.000/0000-00');

  final _telefoneControllerMascara =
      MaskedTextController(mask: '(00) 0 0000-0000');

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //para ativar o autovalidade apenas apos clicar no botao submmit
  bool _autovalidate = false;
  Map<String, int> dados =
  Map(); //variavel para montar os dados que serao inseridos no banco pela API
  Auth auth = Auth();

  Map<String, dynamic> pessoa;
  Map<String, dynamic> prestador;

  _TelaCadastroPrestadorState(this.cdgPessoa);

  @override
  void initState() {
    super.initState();

    //trocar mascara para qdo cpf ou cnpj
    _cpfControllerMascara.beforeChange = (String previous, String next) {
//      print("before previous $previous");
//      print("before next $next");

      String texto = next;
      texto = texto.replaceAll(".", "");
      texto = texto.replaceAll("-", "");
      texto = texto.replaceAll("/", "");

      if (texto.length > 11)
        setState(() {
          _cpfControllerMascara.updateMask('00.000.000/0000-00');
        });
      else
        setState(() {
          _cpfControllerMascara.updateMask('000.000.000-00');
        });


      return true;
    };
  }

/*  Future<Map> _getDadosPessoa(String cdgPessoa) async {
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
//    print("333333333 $pessoa");
//    print("333333333 ${prestador}");

    return pessoa;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
    gradient: LinearGradient(colors: [
      Color(0xFFb30000),
      Color(0xFFcc0000),
      Color(0xFFe60000),
      Color(0xFFff1a1a),
      Color(0xFFff1a1a),
      Color(0xFFe60000),
    ]),
        title: Text(
          "Prestador de Serviços",
        ),
        centerTitle: false,
      ),
      //body: _getFutureBuilder(),
      body:  _getForm(),
    );
  }

/*  Widget _getFutureBuilder() {
    return FutureBuilder(
        future: _getDados(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
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
                print("333333333 $pessoa");
                print("333333333 ${prestador}");
                if ("${pessoa}" != "{pessoa: []}") {
                  _nomeController.text = pessoa["pessoa"][0]["nome"];
                  _emailController.text = pessoa["pessoa"][0]["email"];
                  _senhaController.text = pessoa["pessoa"][0]["senha"];
                  _senhaConfirmController.text = pessoa["pessoa"][0]["senha"];
                  _cpfControllerMascara.text = pessoa["pessoa"][0]["cpfcnpj"];
                  _sobreMimController.text =
                      prestador["prestador"][0]["sobreMim"];
                  _telefoneControllerMascara.text =
                      prestador["prestador"][0]["telefone"];
                }
                return _getForm();
              }
          }
        });
  }*/

  Widget _getForm() {

    _nomeController.text            = PessoaModel.of(context).nome;
    _emailController.text           = PessoaModel.of(context).email;

    //Realmente é necessario esse campo de senha aqui?
    //_senhaController.text           = PessoaModel.of(context);
    //_senhaConfirmController.text    = PessoaModel.of(context);

    _cpfControllerMascara.text              = PessoaModel.of(context).cpfcnpj;
    _sobreMimPrestadorController.text       = PessoaModel.of(context).sobreMimPrestador;
    _telefoneControllerMascara.text         = PessoaModel.of(context).telefonePrestador ?? PessoaModel.of(context).telefoneCliente;
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
           /* TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Entre com seu nome completo',
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o nome';
                  }
                }),
            TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Entre com seu endereço de email',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o e-mail';
                  }
                }),*/
//            TextFormField(
//                controller: _senhaController,
//                decoration: const InputDecoration(
//                  icon: const Icon(Icons.vpn_key),
//                  hintText: 'Entre com a senha',
//                  labelText: 'Senha',
//                ),
//                obscureText: true,
//                validator: (value) {
//                  if (value.isEmpty) {
//                    return 'Entre com a senha';
//                  }
//                  if (value.length < 6) {
//                    return 'Mínimo 6 caracteres';
//                  }
//                  if (value != _senhaConfirmController.text) {
//                    return 'Senha e Repetir Senha são diferentes.';
//                  }
//                }),
//            TextFormField(
//                controller: _senhaConfirmController,
//                decoration: const InputDecoration(
//                  icon: const Icon(Icons.vpn_key),
//                  hintText: 'Repita a senha',
//                  labelText: 'Repetir Senha',
//                ),
//                obscureText: true,
//                validator: (value) {
//                  if (value.isEmpty) {
//                    return 'Entre com a senha';
//                  }
//                  if (value.length < 6) {
//                    return 'Mínimo 6 caracteres';
//                  }
//                  if (value != _senhaConfirmController.text) {
//                    return 'Senha e Repetir Senha são diferentes';
//                  }
//                }
//                //keyboardType: TextInputType.emailAddress,
//                ),
            TextFormField(
                controller: _cpfControllerMascara,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assignment),
                  hintText: 'Entre com o CPF ou CNPJ',
                  labelText: 'CPF/CNPJ',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o CPF';
                  }
                }),
            TextFormField(
                controller: _telefoneControllerMascara,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Entre com o Telefone',
                  labelText: 'Telefone',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entre com o telefone';
                  }
                }),
//            TextFormField(
//              decoration: const InputDecoration(
//                icon: const Icon(Icons.donut_large),
//                hintText: 'Informe a função',
//                labelText: 'Função',
//              ),
//            ),
//            TextFormField(
//              decoration: const InputDecoration(
//                icon: const Icon(Icons.email),
//                hintText: 'Entre com seu CEP',
//                labelText: 'CEP',
//              ),
//              //keyboardType: TextInputType.emailAddress,
//            ),
//            TextFormField(
//              decoration: const InputDecoration(
//                icon: const Icon(Icons.access_time),
//                hintText: 'Entre com horário de funcionamento',
//                labelText: 'Horário de funcionamento',
//              ),
//              //keyboardType: TextInputType.emailAddress,
//            ),
            TextFormField(
              maxLength: 200,
              controller: _sobreMimPrestadorController,
              decoration: const InputDecoration(
                icon: const Icon(Icons.list),
                hintText: 'Entre com informações sobre você',
                labelText: 'Sobre mim',

              ),
              //keyboardType: TextInputType.emailAddress,
            ),
//            TextFormField(
//              decoration: const InputDecoration(
//                icon: const Icon(Icons.phone),
//                hintText: 'Entre com seu telefone',
//                labelText: 'Telefone',
//              ),
//              //keyboardType: TextInputType.number,
//            ),
           /* SizedBox(
              height: 30.0,
            ),*/
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: seg,
                        onChanged: (bool value) {
                          setState(() {
                            seg = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: ter,
                        onChanged: (bool value) {
                          setState(() {
                            ter = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quar,
                        onChanged: (bool value) {
                          setState(() {
                            quar = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quin,
                        onChanged: (bool value) {
                          setState(() {
                            quin = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sex,
                        onChanged: (bool value) {
                          setState(() {
                            sex = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sab,
                        onChanged: (bool value) {
                          setState(() {
                            sab = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: dom,
                        onChanged: (bool value) {
                          setState(() {
                            dom = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "Segunda Feira",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Terça Feira",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text(
                        "Quarta Feira",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text(
                        "Quinta Feira",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text(
                        "Sexta Feira",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text(
                        "Sabado",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text(
                        "Domingo",
                        style: TextStyle(fontSize: 17.0, color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: segManha,
                        onChanged: (bool value) {
                          setState(() {
                            segManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: terManha,
                        onChanged: (bool value) {
                          setState(() {
                            terManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quarManha,
                        onChanged: (bool value) {
                          setState(() {
                            quarManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quinManha,
                        onChanged: (bool value) {
                          setState(() {
                            quinManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sexManha,
                        onChanged: (bool value) {
                          setState(() {
                            sexManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sabManha,
                        onChanged: (bool value) {
                          setState(() {
                            sabManha = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: domManha,
                        onChanged: (bool value) {
                          setState(() {
                            domManha = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: segTarde,
                        onChanged: (bool value) {
                          setState(() {
                            segTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: terTarde,
                        onChanged: (bool value) {
                          setState(() {
                            terTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quarTarde,
                        onChanged: (bool value) {
                          setState(() {
                            quarTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: quinTarde,
                        onChanged: (bool value) {
                          setState(() {
                            quinTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sexTarde,
                        onChanged: (bool value) {
                          setState(() {
                            sexTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: sabTarde,
                        onChanged: (bool value) {
                          setState(() {
                            sabTarde = value;
                          });
                        },
                      ),
                      Checkbox(
                        value: domTarde,
                        onChanged: (bool value) {
                          setState(() {
                            domTarde = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),


         GradientButton(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFb30000),
                  Color(0xFFcc0000),
                  Color(0xFFe60000),
                  Color(0xFFff1a1a),
                  Color(0xFFff1a1a),
                  Color(0xFFe60000),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.center,
              ),
    increaseWidthBy: 100.0,
              child: Text("Cadastrar", style: TextStyle(fontSize: 20.0),),
              callback: () {
                _autovalidate = true;
                if (_formKey.currentState.validate()) {
                  //montando o Map para interacao com a API
                   int a = int.tryParse(PessoaModel.of(context).cdgPessoa);
                   String url= "cdgpessoa=${a}&domingo_manha=${domManha ? 1:0}&domingo_tarde=${domTarde ? 1:0}&segunda_manha=${ segManha ? 1:0} &segunda_tarde=${segTarde ? 1:0} &terca_manha=${terManha ? 1:0} &terca_tarde=${terTarde ? 1:0} &quarta_manha= ${quarManha ? 1:0} &quarta_tarde= ${quarTarde ? 1:0} "
                       "&quinta_manha= ${quinManha ? 1:0} &quinta_tarde= ${quinTarde ? 1:0} &sexta_manha= ${sexManha ? 1:0} &sexta_tarde= ${sexTarde ? 1:0} &sabado_manha= ${sabManha ? 1:0} &sabado_tarde= ${sabTarde ? 1:0}";
                  /*dados = {
                    "cdgpessoa": a,
                   "domingo_manha": domManha ? 1:0,
                    "domingo_tarde": domTarde ? 1:0,
                    "segunda_manha": segManha ? 1:0,
                    "segunda_tarde": segTarde ? 1:0,
                    "terca_manha": terManha ? 1:0,
                    "terca_tarde": terTarde ? 1:0,
                    "quarta_manha": quarManha ? 1:0,
                    "quarta_tarde": quarTarde ? 1:0,
                    "quinta_manha": quinManha ? 1:0,
                    "quinta_tarde": quinTarde ? 1:0,
                    "sexta_manha": sexManha ? 1:0,
                    "sexta_tarde": sexTarde ? 1:0,
                    "sabado_manha": sabManha ? 1:0,
                    "sabado_tarde": sabTarde ? 1:0,
                  };*/

                  int ativoPrestador = 1;
                   PessoaModel.of(context).salvaPrestador(ativoPrestador: ativoPrestador, sobreMimPrestador: _sobreMimPrestadorController.text, telefonePrestador: _telefoneControllerMascara.text);
                   _launchURL(dados, urlComplemento: url);
                   PessoaModel.of(context).ativoPrestador = 1;
                   PessoaModel.of(context).telefonePrestador = _telefoneControllerMascara.text;
                   PessoaModel.of(context).sobreMimPrestador = _sobreMimPrestadorController.text;
                   Navigator.of(context).pushNamed('/telaPrincipalEmpresa');
              }

              }
            ),



//            Container(
//              //padding: const EdgeInsets.only(left: 40.0, top: 20.0),
//              width: double.infinity,
//              child: new RaisedButton(
//                shape: StadiumBorder(),
//                child: const Text(
//                  'CADASTRAR',
//                  style: TextStyle(color: Colors.white),
//                ),
//                color: Theme.of(context).primaryColor,
//                onPressed: () {
//                  _autovalidate = true;
//                  if (_formKey.currentState.validate()) {
//                    //montando o Map para interacao com a API
//                    dados = {
//                      "nome": _nomeController.text,
//                      "email": _emailController.text,
//                      "senha": _senhaController.text,
//                      "cpfcnpj": _cpfControllerMascara.text,
//                      "telefone": _telefoneControllerMascara.text
//                    };

                    //////////*******CRIANDO USUARIO NO FIREBASE  ********/////////////////////
//                    print(auth.signUp(
//                        _emailController.text, _senhaController.text));
                   /* auth
                        .signUp(_emailController.text, _senhaController.text)
                        .then((value) {
                      //Cria um registro com todos os dados no banco de dados no gearhost
                      _launchURL(dados).then((a) {
                        //se tiver sucesso ao cadastrar ir para a tela principal cliente
                        Navigator.of(context)
                            .pushReplacementNamed('/telaPrincipalCliente');
                      });
                    }).catchError((e) {
                      print("DENTRO DO CATCH ERROR ${e.toString()}");
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("E-mail ou senha invalidos"),
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 3),
                      ));
                    });*/
                    /////////******************************////////////////////

                    //ToDo: salvar dados para tabela prestador
                    //ToDo: verificar se eh alteracao de dados para dar update ao invez de insert no banco
                    //ToDo: verificar se eh alteracao de dados para dar update ao invez de insert no firebase

//                  }
//                },
//              ),
//            ),
          ],
        ));
  }
}

//Metodo para criacao de registro de prestador no banco de dados da gearhost
Future<Null> _launchURL(Map<String, int> dados, {String urlComplemento}) async {
  String url = "http://alguz1.gearhostpreview.com/cadastra_prestador_horario.php?${urlComplemento}";
  var response = await http.post(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print("Number of books about http: $itemCount.");
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
}
