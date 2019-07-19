import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/tela_agendamento_prestador.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pi/view/tela_cadastro_servico.dart';


//select categoriaservico.icone cat_icone, categoriaservico.descricao cat_descr,
//    servico.nome ser_nome, servico.descricao ser_descr,
//    prestadorservico.preco serp_preco
//from prestadorservico
//left join servico on servico.cdgServico = prestadorservico.cdgServico
//left join categoriaservico on servico.cdgCategoria = categoriaservico.cdgCategoria
//where prestadorservico.cdgPessoa = 2

class TabServicosPrestador extends StatefulWidget {

  final String cdgPessoa;

  TabServicosPrestador(this.cdgPessoa);

  @override
  _TabServicosPrestadorState createState() => _TabServicosPrestadorState(cdgPessoa);
}

class _TabServicosPrestadorState extends State<TabServicosPrestador> {

  final String cdgPessoa;
  Map<String, dynamic> servicos;

  _TabServicosPrestadorState(this.cdgPessoa);

  Future<Map> _getDadosApi(String cdgPessoa) async {
    http.Response response;
    response = await http.get(
        "http://alguz1.gearhostpreview.com/lista.php?sql=select categoriaservico.icone cat_icone, categoriaservico.descricao cat_descr, servico.nome ser_nome, servico.descricao ser_descr, prestadorservico.preco serp_preco from prestadorservico left join servico on servico.cdgServico = prestadorservico.cdgServico left join categoriaservico on servico.cdgCategoria = categoriaservico.cdgCategoria where prestadorservico.cdgPessoa = $cdgPessoa");
    print("${response.body}");
    return json.decode(response.body);
  }

  Future<Map> _getDados() async {
    servicos = await _getDadosApi(cdgPessoa);
    print("${servicos}");
    return servicos;
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
                print("snap ${snapshot}");
                print("snap length ${snapshot.data["Custom"].length}");
                //print("snap ser_nome ${snapshot.data["Custom"][0]["ser_nome"]}");

                return getScaffold(context, snapshot);

//                  print("mostrar tela de perfil");
//                  //mostra tela de perfil
//
//                  print("$pessoa");
//                  print("${prestador}");
//                  print(
//                      "${prestador["prestador"]}"); //pessoa["pessoa"][0]["nome"]
//                  print("${prestador["prestador"][0]}");
//                  print("${prestador["prestador"][0]["nota"]}");
//                  print("${pessoa["pessoa"][0]["imagem"]}");
//
//                  return DefaultTabController(
//                    length: 3,
//                    child: Scaffold(
//                      appBar: AppBar(
//                        flexibleSpace: FlexibleSpaceBar(
//                          centerTitle: true,
//                          title: Center(
//                            child: getTop(),
//                          ),
//                        ),
//                        bottom: PreferredSize(
//                          preferredSize: Size.square(180.0),
//                          child: getTabBar(),
//                        ),
//                      ),
//                      body: getTabBarPages(),
//                    ),
//                  );
              }
          }
        });

  }

  Widget _createListView(context, snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["Custom"].length,
      itemBuilder: (context, index) {
//        print(snapshot.data["categoriaservico"].length);
//        print(index);
        return getCard(context, snapshot, index);
      },
    );
  }

  Widget getScaffold(context, snapshot){
    return Scaffold(
      //se a pessoa logada for a mesma do perfil prestador visualizado
      floatingActionButton: PessoaModel.of(context).cdgPessoa == cdgPessoa
      // permite adicionar servicos para o prestado
        ? getFloatingActionButtonAdicionarServico()
      // senao, permite a pessoa agenar servicos com este prestador
       :
        //se lista vazia (prestador nao tem servicos)
        (snapshot.data["Custom"].length == 0)
        //nao permite agendar
        ? null
        //mostra botao que permite agendar o servico
        : getFloatingActionButtonAgendarServico(),
      body:
      //se a lista de servicos do prestador estiver vazia
      (snapshot.data["Custom"].length == 0)
      //monta container em branco
      ? Container(color: Colors.white,
      child: Center(
        child: Text("Lista de serviços esta vazia."),
      ),)
      //senao, monta lista com o servicos que este prestador faz
      : _createListView(context, snapshot)
      ,
    );
  }

  Widget getFloatingActionButtonAgendarServico(){
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
        );
      },
      child: Icon(Icons.calendar_today),
    );
  }

  Widget getFloatingActionButtonAdicionarServico(){
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaCadastroServico()),
        );
      },
      child: Icon(Icons.add),
    );
  }  

  Widget getCard(context, snapshot, index) {
    return Card(
      margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: (){
          //se a pessoa logada for a mesma do perfil prestador visualizado
          if (PessoaModel.of(context).cdgPessoa == cdgPessoa)
          // permite adicionar servicos para o prestado
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaCadastroServico()),
            );
          // senao, permite a pessoa agendar servicos com este prestador
          else
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaAgendamentoPrestador()),
            );
        },
        child: SizedBox(
          height: 90.0,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      //Icons.healing,
                      IconData(
                          int.parse(snapshot.data["Custom"][index]["cat_icone"]),
                          fontFamily: 'MaterialIcons'
                      ),
                      size: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    radius: 15,
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    snapshot.data["Custom"][index]["ser_nome"],
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8.0, right: 4.0),
                //width: MediaQuery.of(context).size.width * 0.95,
                height: 30.0,
                child: Text(snapshot.data["Custom"][index]["ser_descr"],
                  style: TextStyle(fontSize: 12.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),


              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    "R\$ ${snapshot.data["Custom"][index]["serp_preco"]}",
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
