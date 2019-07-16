import 'package:flutter/material.dart';
import 'package:pi/view/tela_cadastro_cliente.dart';

class TabPerfilCliente extends StatefulWidget {
  @override
  _TabPerfilClienteState createState() => _TabPerfilClienteState();
}

class _TabPerfilClienteState extends State<TabPerfilCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaCadastro()),
          );
        },
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sobre mim",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis! Detraxit consequat et quo num tendi nada. Não sou faixa preta cumpadi, sou preto inteiris, inteiris.Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis! Detraxit consequat et quo num tendi nada. Não sou faixa preta cumpadi, sou preto inteiris, inteiris.Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis!",
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Telefone",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "19 9 9555 6666",
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "pessoa@gmail.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
