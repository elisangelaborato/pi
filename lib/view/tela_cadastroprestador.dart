import 'package:flutter/material.dart';

class TelaCadastroPrestador extends StatefulWidget {
  @override
  _TelaCadastroPrestadorState createState() => _TelaCadastroPrestadorState();
}

class _TelaCadastroPrestadorState extends State<TelaCadastroPrestador> {
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
      domTardde = false;
  bool segManha = false,
      terManha = false,
      quarManha = false,
      quinManha = false,
      sexManha = false,
      sabManha = false,
      domManha = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro Prestador",
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "CEP",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.red[800]),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Sobre mim",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.red[800]),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Telefone",
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.red[800]),
                ),
              ),
              SizedBox (height: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text("          Manhã   Tarde",
                    style: TextStyle(fontSize: 14.0, color: Colors.red[800]),
                  ),
                ],
              ),
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
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Terça Feira",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Quarta Feira",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Quinta Feira",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Sexta Feira",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Sabado",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Domingo",
                          style: TextStyle(fontSize: 17.0, color: Colors.red[800]),
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
                          value: domTardde,
                          onChanged: (bool value) {
                            setState(() {
                              domTardde = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                padding: EdgeInsets.only(
                    top: 08.0, left: 08.0, right: 08.0, bottom: 08.0),
                color: Colors.red[800],
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
