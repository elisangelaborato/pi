import 'package:flutter/material.dart';

class TelaAgendamentoCliente extends StatefulWidget {
  @override
  _TelaAgendamentoClienteState createState() => _TelaAgendamentoClienteState();
}

class _TelaAgendamentoClienteState extends State<TelaAgendamentoCliente> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _prestadors = <String>['', 'Adamastor', 'Antonieta', 'Benedito', 'Joana',];
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
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento"),
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

            FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.assignment_ind),
                    labelText: 'Prestador do Serviço',
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
            ),

            FormField(
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
            ),



            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your first and last name',
                labelText: 'Name',
              ),
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'Dob',
              ),
              keyboardType: TextInputType.datetime,
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                //WhitelistingTextInputFormatter.digitsOnly,
              ],
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter a email address',
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                  child: const Text('Confirmar', style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                )),
          ],
        ));
  }

  Widget getColumn() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
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
