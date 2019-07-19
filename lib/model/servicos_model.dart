import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ServicosModel extends Model{

  static ServicosModel of(BuildContext context) =>
      ScopedModel.of<ServicosModel>(context);

  Map tiposServicos = Map();
  Map topPrestadores = Map();

  void setTipoServicos() async {
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=categoriaservico");
    tiposServicos = convert.json.decode(response.body);
    notifyListeners();
    //print(tiposServicos);
  }

  Future<Map> getTiposServicos() async{
    if(tiposServicos.isEmpty)
      {
        await setTipoServicos();
        print("DADOS = NULL");
      }
      print("Retornando os dados");

    return tiposServicos;
  }


  void _setTopPrestadores() async {
    String consulta = "SELECT * FROM pessoa p INNER JOIN prestador pr ON p.cdgPessoa = pr.cdgPessoa WHERE pr.ativoPrestador = 1 ORDER BY notaPrestador DESC LIMIT 10";
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=${consulta}");
    topPrestadores = convert.json.decode(response.body);
    notifyListeners();
    //print(topPrestadores);
  }

  Future<Map> getTopPrestadores() async{
    if(topPrestadores.isEmpty)
    {
      await _setTopPrestadores();
      print("DADOS = NULL");
    }
    return topPrestadores;
}

 void salvaAgendamento(String cdgPessoa_cliente, String cdgPessoa_prestador, String cdgServico, String dataAgendamento, String horaAgendamento, String situacaoAgendamento, String preco){


   Map<String, dynamic> map = {
     "cdgPessoa_cliente": cdgPessoa_cliente,
     "cdgPessoa_prestador": cdgPessoa_prestador,
     "cdgServico": cdgServico,
     "dataAgendamento": dataAgendamento,
     "horaAgendamento": horaAgendamento,
     "situacaoAgendamento": situacaoAgendamento,
     "preco" : preco
   };
   String url = "cadastra_agendamento.php?cdgPessoa_cliente=${cdgPessoa_cliente}&cdgPessoa_prestador=${cdgPessoa_prestador}&cdgServico=${cdgServico}";

   _launchURL(map, url);
 }

  _launchURL(Map<String, dynamic> dados, String complementoURL) async {
    String url = "http://alguz1.gearhostpreview.com/${complementoURL}";
    print(url);
    var response = await http.post(url, body: dados);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //var itemCount = jsonResponse['totalItems'];
      //print("Number of books about http: $itemCount.");
      //print(jsonResponse);
    } else {
      //print("Falha com status: ${response.statusCode}.");
    }
  }
}