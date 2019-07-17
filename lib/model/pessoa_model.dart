import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PessoaModel extends Model {
  static PessoaModel of(BuildContext context) =>
      ScopedModel.of<PessoaModel>(context);

  //Dados tabela pessoa
  String uid;
  String cdgPessoa;
  String nome;
  String email;
  String cpfcnpj;
  String imagem;

  //Dados tabela cliete
  String sobreMimCliente;
  String notaCliente;
  String telefoneCliente;
  String ativoCliente;

  //Dados tabela prestador
  String sobreMimPrestador;
  String notaPrestador;
  String telefonePrestador;
  String ativoPrestador;

  //variaveis de controle
  bool logado = false;

  void getDados(String uid) async {
    String consulta =
        "SELECT * FROM pessoa p INNER JOIN cliente c ON c.cdgPessoa = p.cdgPessoa INNER JOIN prestador pt ON pt.cdgPessoa = p.cdgPessoa WHERE p.uid = '${uid}'";
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=${consulta}");
    var dados = json.decode(response.body);
    FromMap(dados);
  }

  FromMap(Map dados) {
    //dados da tabela de pessoa
    cdgPessoa   = dados['Custom'][0]['cdgPessoa'];
    nome        = dados['Custom'][0]['nome'];
    email       = dados['Custom'][0]['email'];
    cpfcnpj     = dados['Custom'][0]['cpfcnpj'];
    imagem      = dados['Custom'][0]['imagem'];

    //dados da tabela de cliente
    sobreMimCliente   = dados['Custom'][0]['sobreMimCliente'];
    notaCliente       = dados['Custom'][0]['notaCliente'];
    telefoneCliente   = dados['Custom'][0]['telefoneCliente'];
    ativoCliente      = dados['Custom'][0]['ativoCliente'];

    //dados da tabela de prestador
    sobreMimPrestador   = dados['Custom'][0]['sobreMimPrestador'];
    notaPrestador       = dados['Custom'][0]['notaPrestador'];
    telefonePrestador   = dados['Custom'][0]['telefonePrestador'];
    ativoPrestador      = dados['Custom'][0]['ativoPrestador'];

    notifyListeners();
  }

  void Logar (bool a){
    this.logado = a;
    notifyListeners();
  }

  /* Map toMap(){
    Map<String, dynamic> map = {
      nomeColuna : nome,
      emailColuna : email,
      telefoneColuna : telefone,
      imgColuna : imagem,
    };
    if(id != null) {
      map[idColuna] = id;
    }
    return map;
  }*/
}
