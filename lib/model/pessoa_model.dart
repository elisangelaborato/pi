import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  int ativoPrestador;

  //variaveis de controle
  bool logado = false;

  bool _logadoComoCliente = false;
  bool _logadoComoPrestadorServicos = false;

  getModo(){
    return _logadoComoPrestadorServicos;

  }

  void logadoComoCliente(bool valor){
    _logadoComoCliente = valor;
    _logadoComoPrestadorServicos = !valor;
  }

  void logadoComoPrestadorServicos(bool valor){
    _logadoComoPrestadorServicos = valor;
    _logadoComoCliente = !valor;
  }

  bool isLogadoComoCliente() => _logadoComoCliente;

  void getDados(String uid) async {
    String consulta =
        "SELECT * FROM pessoa p INNER JOIN cliente c ON c.cdgPessoa = p.cdgPessoa INNER JOIN prestador pt ON pt.cdgPessoa = p.cdgPessoa WHERE p.uid = '${uid}'";
    http.Response response;
    response = await http
        .get("http://alguz1.gearhostpreview.com/lista.php?sql=${consulta}");
    var dados = convert.json.decode(response.body);
    FromMap(dados);
  }

  FromMap(Map dados) {
    //dados da tabela de pessoa
    cdgPessoa = dados['Custom'][0]['cdgPessoa'];
    nome = dados['Custom'][0]['nome'];
    email = dados['Custom'][0]['email'];
    cpfcnpj = dados['Custom'][0]['cpfcnpj'];
    imagem = dados['Custom'][0]['imagem'];

    //dados da tabela de cliente
    sobreMimCliente = dados['Custom'][0]['sobreMimCliente'];
    notaCliente = dados['Custom'][0]['notaCliente'];
    telefoneCliente = dados['Custom'][0]['telefoneCliente'];
    ativoCliente = dados['Custom'][0]['ativoCliente'];

    //dados da tabela de prestador
    sobreMimPrestador = dados['Custom'][0]['sobreMimPrestador'];
    notaPrestador = dados['Custom'][0]['notaPrestador'];
    telefonePrestador = dados['Custom'][0]['telefonePrestador'];
    ativoPrestador = int.parse(dados['Custom'][0]['ativoPrestador']);

    notifyListeners();
  }

  void Logar(bool a) {
    this.logado = a;
    notifyListeners();
  }

  void salvaPessoa({String nome, String cpfcnpj, String imagem}) {
    if (nome == null) nome = this.nome;
    if (cpfcnpj == null) cpfcnpj = this.cpfcnpj;
    if (imagem == null) imagem = this.imagem;

    Map<String, dynamic> map = {
      "nome": nome,
      "cpfcnpj": cpfcnpj,
      "imagem": imagem,
    };

    _launchURL(map, "pessoa", this.cdgPessoa, "cdgPessoa");
  }

  void salvaCliente(
      {String sobreMimCliente,
      String notaCliente,
      String telefoneCliente,
      String ativoCliente}) {
    if (sobreMimCliente == null) sobreMimCliente = this.sobreMimCliente;
    if (notaCliente == null) notaCliente = this.notaCliente;
    if (telefoneCliente == null) telefoneCliente = this.telefoneCliente;
    if (ativoCliente == null) ativoCliente = this.ativoCliente;

    Map<String, dynamic> map = {
      "sobreMimCliente": sobreMimCliente,
      "notaCliente": notaCliente,
      "telefoneCliente": telefoneCliente,
      "ativoCliente": ativoCliente
    };
    _launchURL(map, "cliente", this.cdgPessoa, "cdgPessoa");
  }

  void salvaPrestador(
      {String sobreMimPrestador,
      String notaPrestador,
      String telefonePrestador,
      int ativoPrestador}) {
    if (sobreMimPrestador == null) sobreMimPrestador = this.sobreMimPrestador;
    if (notaPrestador == null) notaPrestador = this.notaPrestador;
    if (telefonePrestador == null) telefonePrestador = this.telefonePrestador;
    if (ativoPrestador == null) ativoPrestador = this.ativoPrestador;

    Map<String, dynamic> map = {
      "sobreMimPrestador": sobreMimPrestador,
      "notaPrestador": notaPrestador,
      "telefonePrestador": telefonePrestador,
      "ativoPrestador": ativoPrestador
    };
    _launchURL(map, "prestador", this.cdgPessoa, "cdgPessoa");
  }

   _launchURL(Map<String, dynamic> dados, String tabela, String codigo, String idTabela) async {
    String url = "http://alguz1.gearhostpreview.com/atualiza.php?codigo=${codigo}&tabela=${tabela}&idTabela=${idTabela}";
    print(url);
    print(dados['imagem']);
    var response = await http.post(url, body: dados);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print("Number of books about http: $itemCount.");
      print(jsonResponse);
    } else {
      print("Falha com status: ${response.statusCode}.");
    }
  }
}
