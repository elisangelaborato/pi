import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pi/view/tela_principal_empresa.dart';

class TelaCadastroServico extends StatefulWidget {
  @override
  _TelaCadastroServicoState createState() => _TelaCadastroServicoState();
}

class _TelaCadastroServicoState extends State<TelaCadastroServico> {
  var _categoria = ['Saúde', 'Professores', 'Manuntenção'];
  var _currentItemSelected = 'Saúde';
  MoneyMaskedTextController _maskedMoney = MoneyMaskedTextController(
      leftSymbol: "R\$ ", decimalSeparator: ',', thousandSeparator: '.');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xff000080),
            const Color(0xff0000ff),
            const Color(0xff0086b3),
          ],
        ),
        title: Text("Cadastrar Serviços"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                  child: Icon(Icons.assignment_ind, color: Colors.blue),
                ),
                Container(
                  child: Text(
                    "Escolha sua Categoria",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: DropdownButton<String>(
                items: _categoria.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValeuSelected) {
                  setState(() {
                    this._currentItemSelected = newValeuSelected;
                  });
                },
                value: _currentItemSelected,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    hintText: 'Ex: Professor de Inglês, Enfermeira, Pintor...',
                    labelText: 'Nome da Profissão',
                    labelStyle: TextStyle(color: Colors.blue),
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                  maxLength: 50,
                ),
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0)),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  hintText: 'Descreva brevemente seu serviço',
                  labelText: 'Descrição do Serviço',
                  labelStyle: TextStyle(color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.blue),
                ),
                maxLength: 200,
              ),
              padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Icon(Icons.monetization_on, color: Colors.blue),
                ),
                Padding(
                  child: Text(
                    "Valor",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.blue,
                          blurRadius: 10.0,
                          offset: new Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                      child: TextField(
                      controller: _maskedMoney,
    keyboardType:
    TextInputType.numberWithOptions(decimal: true),
    ),
    ),
                  ),
                SizedBox(
                  width: 150.0,
                ),
              ],
            ),
            Container(
              width: 300,
              padding: EdgeInsets.fromLTRB(120, 80, 0, 0),
              child: FlatButton(
                shape: StadiumBorder(),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TelaPrincipalEmpresa()));
                },
                child: Text(
                  "Cadastrar-se",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
