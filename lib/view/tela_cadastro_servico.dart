import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pi/model/servicos_model.dart';
import 'package:pi/view/tela_principal_empresa.dart';
import 'package:pi/model/servicos_model.dart';

class TelaCadastroServico extends StatefulWidget {
  @override
  _TelaCadastroServicoState createState() => _TelaCadastroServicoState();
}

class _TelaCadastroServicoState extends State<TelaCadastroServico> {

  List<String> _categoria = ['Saúde', 'Professores', 'Manuntenção'];
  String _currentItemSelected = 'Saúde';
  MoneyMaskedTextController _maskedMoney = MoneyMaskedTextController(
      leftSymbol: "R\$ ", decimalSeparator: ',', thousandSeparator: '.');

  Future setarCategorias() async {
    _categoria.clear();
    ServicosModel.of(context).getTiposServicos().then( (v) {
      v["categoriaservico"].forEach( (c) {
        _categoria.add(v["descricao"]);
      });
    });
  }

  @override
  void initState() {
    //setarCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF000033),
            Color(0xFF000066),
            Color(0xFF000080),
            Color(0xFF0000b3),
            Color(0xFF0000e6),
            Color(0xFF0000ff),
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
                  child: Icon(Icons.assignment_ind, color: Colors.grey),
                ),
                Container(
                  child: Text(
                    "Escolha sua Categoria",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: FutureBuilder(
                  future: setarCategorias(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Container(
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
                          //return Container(color: Colors.pinkAccent, height: 50, width: double.infinity,);
                          return Text("");
                          /*DropdownButton<String>(
                            isExpanded: true,
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
                            TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          );*/
                        }
                    }
                  }),


//              child: DropdownButton<String>(
//                items: _categoria.map((String dropDownStringItem) {
//                  return DropdownMenuItem<String>(
//                    value: dropDownStringItem,
//                    child: Text(dropDownStringItem),
//                  );
//                }).toList(),
//                onChanged: (String newValeuSelected) {
//                  setState(() {
//                    this._currentItemSelected = newValeuSelected;
//                  });
//                },
//                value: _currentItemSelected,
//                style:
//                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//              ),
//
            ),
            Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    hintText: 'Ex: Professor de Inglês, Enfermeira, Pintor...',
                    labelText: 'Nome da Profissão',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  maxLength: 50,
                ),
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0)),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  hintText: 'Descreva brevemente seu serviço',
                  labelText: 'Descrição do Serviço',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintStyle: TextStyle(color: Colors.grey),
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
                  child: Icon(Icons.monetization_on, color: Colors.grey),
                ),
                Padding(
                  child: Text(
                    "Valor",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300],
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
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
            Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: GradientButton(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000033),
                  Color(0xFF000066),
                  Color(0xFF000080),
                  Color(0xFF0000b3),
                  Color(0xFF0000e6),
                  Color(0xFF0000ff),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.center,
              ),
                increaseWidthBy: 190.0,
              child: Text("Cadastrar", style: TextStyle(fontSize: 20.0),),
              callback: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TelaPrincipalEmpresa()));
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
