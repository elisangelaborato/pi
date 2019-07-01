import 'package:flutter/material.dart';

class TabPerfilPrestador extends StatefulWidget {
  @override
  _TabPerfilPrestadorState createState() => _TabPerfilPrestadorState();
}

class _TabPerfilPrestadorState extends State<TabPerfilPrestador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                  "Especialidades",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Eletricista; encanador; marceneiro; pedreiro.",
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
    
    
//    return Stack(
//      children: <Widget>[
//        Row(
//          mainAxisAlignment: MainAxisAlignment.end,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.edit),
//              onPressed: () {},
//            ),
//          ],
//        ),
//
//        SingleChildScrollView(
//          child: Padding(
//            padding: EdgeInsets.all(16.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Sobre mim",
//                  style: TextStyle(fontSize: 18),
//                ),
//                Text(
//                  "Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis! Detraxit consequat et quo num tendi nada. Não sou faixa preta cumpadi, sou preto inteiris, inteiris.Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis! Detraxit consequat et quo num tendi nada. Não sou faixa preta cumpadi, sou preto inteiris, inteiris.Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Quem num gosta di mim que vai caçá sua turmis!",
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 16.0),
//                ),
//                Text(
//                  "Especialidades",
//                  style: TextStyle(fontSize: 18),
//                ),
//                Text(
//                  "Eletricista; encanador; marceneiro; pedreiro.",
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 16.0),
//                ),
//                Text(
//                  "Telefone",
//                  style: TextStyle(fontSize: 18),
//                ),
//                Text(
//                  "19 9 9555 6666",
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 16.0),
//                ),
//                Text(
//                  "Email",
//                  style: TextStyle(fontSize: 18),
//                ),
//                Text(
//                  "pessoa@gmail.com",
//                ),
//              ],
//            ),
//          ),
//        ),
//      ],
//    );
  }
}
