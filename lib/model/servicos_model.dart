import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicosModel extends Model{

  static ServicosModel of(BuildContext context) =>
      ScopedModel.of<ServicosModel>(context);

  Map tiposServicos = Map();
  Map topPrestadores = Map();

  void setTipoServicos() async {
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=categoriaservico");
    tiposServicos = json.decode(response.body);
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


  void setTopPrestadores() async {
    String consulta = "SELECT * FROM pessoa p INNER JOIN prestador pr ON p.cdgPessoa = pr.cdgPessoa WHERE pr.ativoPrestador = 1 ORDER BY notaPrestador DESC LIMIT 10";
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=${consulta}");
    topPrestadores = json.decode(response.body);
    notifyListeners();
    //print(topPrestadores);
  }

  Future<Map> getTopPrestadores() async{
    if(topPrestadores.isEmpty)
    {
      await setTopPrestadores();
      print("DADOS = NULL");
    }
    return topPrestadores;
}
}