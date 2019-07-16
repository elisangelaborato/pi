import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PessoaModel extends Model{

  static PessoaModel of(BuildContext context)
  => ScopedModel.of<PessoaModel>(context);

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


  void getDados(String uid) async {
    http.Response response;

    //pegando dados da tabela pessoa
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=pessoa&codigo='${uid}'&idTabela=uid");
    var dadosPessoa = json.decode(response.body);
    //print(a);
    //print(a['pessoa'][0]['nome']);
    this.uid = uid;
    FromMapPessoa(dadosPessoa);

    //pegando dados da tabela clinte
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=cliente&codigo=${dadosPessoa['pessoa'][0]['cdgPessoa']}&idTabela=cdgPessoa");
    var dadosCliente = json.decode(response.body);
    //print(dadosCliente);
    //print(dadosCliente['cliente'][0]['cdgPessoa']);
    this.uid = uid;
    FromMapCliente(dadosCliente);

    //pegando dados da tabela prestador
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?tabela=prestador&codigo=${dadosPessoa['pessoa'][0]['cdgPessoa']}&idTabela=cdgPessoa");
    var dadosPrestador = json.decode(response.body);
    //print(dadosPrestador);
    //print(dadosPrestador['prestador'][0]['cdgPessoa']);
    this.uid = uid;
    FromMapPrestador(dadosPrestador);
  }

  FromMapPessoa(Map dadosPessoa){
    cdgPessoa   = dadosPessoa['pessoa'][0]['cdgPessoa'];
    nome        = dadosPessoa['pessoa'][0]['nome'];
    email       = dadosPessoa['pessoa'][0]['email'];
    cpfcnpj     = dadosPessoa['pessoa'][0]['cpfcnpj'];
    imagem      = dadosPessoa['pessoa'][0]['imagem'];
  }

  FromMapCliente(Map dadosCliente){
    sobreMimCliente   = dadosCliente['cliente'][0]['sobreMim'];
    notaCliente       = dadosCliente['cliente'][0]['nota'];
    telefoneCliente   = dadosCliente['cliente'][0]['telefone'];
    ativoCliente      = dadosCliente['cliente'][0]['ativo  '];
  }

  FromMapPrestador(Map dadosPrestador){
    sobreMimPrestador   = dadosPrestador['prestador'][0]['sobreMim'];
    notaPrestador       = dadosPrestador['prestador'][0]['nota'];
    telefonePrestador   = dadosPrestador['prestador'][0]['telefone'];
    ativoPrestador      = dadosPrestador['prestador'][0]['ativo'];
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