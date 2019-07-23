import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:pi/model/servicos_model.dart';
import 'package:pi/model/pessoa_model.dart';

class TelaAgendamentoPrestador extends StatefulWidget {
  String cdgPessoa;
  String cdgServico;
  String nomeServico;
  String preco;
  TelaAgendamentoPrestador(this.cdgPessoa, this.cdgServico, this.nomeServico, this.preco);
  @override
  _TelaAgendamentoPrestadorState createState() =>
      _TelaAgendamentoPrestadorState(cdgPessoa, cdgServico, nomeServico, preco);
}

class _TelaAgendamentoPrestadorState extends State<TelaAgendamentoPrestador> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
String cdgPessoa;
String cdgServico;
String nomeServico;
String preco;
  _TelaAgendamentoPrestadorState(this.cdgPessoa, this.cdgServico, this.nomeServico, this.preco);

  final _textEditingControllerData = TextEditingController();
  final _textEditingControllerHora = TextEditingController();

  List<String> _prestadors = <String>[
    '',
    'Adamastor',
    'Antonieta',
    'Benedito',
    'Joana',
  ];



  String _prestador = '';
  List<String> _servicos = <String>['', 'Lavar Carro', 'Podar Arvore', 'Outro'];
  String _servico = '';

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _textEditingControllerData.text =
            "${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year.toString().padLeft(4, '0')}";
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        _textEditingControllerHora.text =
            "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}";
      });
  }

  @override
  Widget build(BuildContext context) {
    print("Printando o cdgPessoa desse prestador "+cdgPessoa);
    print("Printando o cdgServico desse prestador "+cdgServico);
    DateFormat('yyy-mm-dd');
    return Scaffold(
        appBar: GradientAppBar(
          title: Text("Agendar"),
          centerTitle: true,
          gradient: LinearGradient(colors: [
            Color(0xFFb30000),
            Color(0xFFcc0000),
            Color(0xFFe60000),
            Color(0xFFe60000),
            Color(0xFFff0000),
            Color(0xFFff0000),
          ]),
        ),
//      body: SingleChildScrollView(
//        child: getColumn(),
//      ),
      body: getForm(),
    );
  }

  Widget getForm() {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            /*FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.assignment_ind),
                    labelText: 'Cliente',
                  ),
                  isEmpty: _prestador == '',
                  child: new DropdownButtonHideUnderline(
                    child: new DropdownButton(
                      value: _prestador,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          //newContact.favoriteColor = newValue;
                          _prestador = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _prestadors.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),*/
  /*          FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.assignment),
                    labelText: 'Serviço',
                  ),
                  isEmpty: _servico == '',
                  child: new DropdownButtonHideUnderline(
                    child: new DropdownButton(
                      value: _servico,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          //newContact.favoriteColor = newValue;
                          _servico = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _servicos.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),*/
  Text("Servico: "+nomeServico, style: TextStyle(fontSize: 25),),
            Text("Preco: "+preco, style: TextStyle(fontSize: 25),),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: IgnorePointer(
                child: TextFormField(
                  controller: _textEditingControllerData,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Entre com a data do agendamento',
                    labelText: 'Data',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: IgnorePointer(
                child: TextFormField(
                  controller: _textEditingControllerHora,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.access_time),
                    hintText: 'Entre com horário do agendamento',
                    labelText: 'Horário',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 0, 0),
              child:GradientButton(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFb30000),
                  Color(0xFFcc0000),
                  Color(0xFFe60000),
                  Color(0xFFff1a1a),
                  Color(0xFFff1a1a),
                  Color(0xFFe60000),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: Text("CONFIRMAR", style: TextStyle(fontSize: 20.0),),
              callback: () {


                ServicosModel.of(context).salvaAgendamento(PessoaModel.of(context).cdgPessoa, cdgPessoa, cdgServico, _textEditingControllerData.text
                    , _textEditingControllerHora.text, "AGENDADO", int.parse(preco));
                Navigator.of(context).pop();
              },
              increaseWidthBy: 160.0,
            ),
            ),


//            Container(
//                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
//                child: RaisedButton(
//                  shape: StadiumBorder(),
//                  child: const Text(
//                    'CONFIRMAR',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  color: Theme.of(context).primaryColor,
//                  onPressed: () {},
//                )),
          ],
        ));
  }

  Widget getColumn() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text("${selectedTime.hour}:${selectedTime.minute}"),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectTime(context),
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ],
        ),
        TextField(
          //controller: _nameController,
          decoration: InputDecoration(
            labelText: "Nome",
          ),
          keyboardType: TextInputType.text,
          onChanged: (text) {
            setState(() {
              // _contatoEdited.nome = _nameController.text;
            });
          },
        ),
        TextField(
          //controller: _emailController,
          decoration: InputDecoration(
            labelText: "Email",
          ),
          keyboardType: TextInputType.emailAddress,
          //onChanged: (text) { _contatoEdited.email = text; },
        ),
        TextField(
          //controller: _phoneController,
          decoration: InputDecoration(
            labelText: "Telefone",
            hintText: "00 0 0000 0000",
          ),
          keyboardType: TextInputType.phone,
          //onChanged: (text) { _contatoEdited.telefone = text; },
        ),
      ],
    );
  }
}
