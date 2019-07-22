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
    print(tiposServicos);

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

 void salvaAgendamento(String cdgPessoa_cliente, String cdgPessoa_prestador, int cdgServico, String dataAgendamento, String horaAgendamento, String situacaoAgendamento, int preco){


  /* Map<String, dynamic> map = {
     "cdgPessoa_cliente": cdgPessoa_cliente,
     "cdgPessoa_prestador": cdgPessoa_prestador,
     "cdgServico": cdgServico,
     "dataAgendamento": dataAgendamento,
     "horaAgendamento": horaAgendamento,
     "situacaoAgendamento": situacaoAgendamento,
     "preco" : preco
   };
   String url = "cadastra_agendamento.php?cdgPessoa_cliente=${cdgPessoa_cliente}&cdgPessoa_prestador=${cdgPessoa_prestador}&cdgServico=${cdgServico}";*/
    String urlget = "cadastra_agendamento.php?cdgPessoa_cliente=${cdgPessoa_cliente}&cdgPessoa_prestador=${cdgPessoa_prestador}&cdgServico=${cdgServico}&dataAgendamento=${dataAgendamento}&horaAgendamento=${horaAgendamento}&situacaoAgendamento=${situacaoAgendamento}&preco=${preco}";
   _launchURL(urlget);
 }

 Future<List<String>> getListaServicos(String cdgPessoa) async {
    String complementoURL = "lista.php?sql=SELECT * FROM servico s INNER JOIN prestadorservico ps ON s.cdgServico = ps.cdgServico INNER JOIN prestador p ON p.cdgPessoa = ps.cdgPessoa WHERE p.cdgPessoa = ${cdgPessoa}";
    String url = "http://alguz1.gearhostpreview.com/${complementoURL}";
    print(url);
    List c = List();
    var response = await http.post(url);
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse['Custom'].length);

    for(int a = 0; a < jsonResponse['Custom'].length; a++  ){
        c.add( jsonResponse['Custom'][a]['cdgPessoa']);
    }

    print(">>>>>>>>>>>>>>");
    print(c);
    //print(jsonResponse['Custom'][0]['cdgPessoa']);
    return c;
 }

  _launchURL(String complementoURL) async {
    String url = "http://alguz1.gearhostpreview.com/${complementoURL}";
    print(url);
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print("Falha com status: ${response.statusCode}.");
    }
  }
}