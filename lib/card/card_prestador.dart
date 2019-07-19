import 'package:flutter/material.dart';
import 'package:pi/model/pessoa_model.dart';
import 'package:pi/view/tela_perfil_prestador.dart';

Widget CardPrestador(context, snapshot, index) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 105.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            buildCircleAvatar(context, snapshot, index),
            SizedBox(width: 4.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //linha: nome fornecedor, nota avaliacao
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        snapshot.data["Custom"][index]["nome"],
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Avaliação: ${snapshot.data["Custom"][index]["notaPrestador"]}",
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 4.0,
                ),

                //sobre mim
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text( snapshot.data["Custom"][index]["sobreMimPrestador"] ?? "",
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                //email, telefone
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(snapshot.data["Custom"][index]["email"] ?? "",
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        snapshot.data["Custom"][index]["telefonePrestador"] ?? "",
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),
                //BOTAO DETALHAR
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 15.0,
                          child: Text(
                            "DETALHAR",
                            style: TextStyle(color: Colors.indigo,
                              fontSize: 12.0, fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {

                          String cdgPessoa = snapshot.data["Custom"][index]["cdgPessoa"];

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TelaPerfilPrestador(
                                  // nao me acertei em mandar direto o map da pessoa, por hora mando codigo
                                  //pessoa: snapshot.data["pessoa"][index],
                                  cdgPessoa: cdgPessoa,
                                )
                            ),
                          );

                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCircleAvatar(context, snapshot, index) {
  //se cliente logado, vai ver imagem do prestador que o avaliou
  //se prestador logado, vai ver imagem do cliente que o avaliou
  String imagem = snapshot.data["Custom"][index]["imagem"];
//  if (PessoaModel.of(context).isLogadoComoCliente())
//    imagem = snapshot.data["Custom"][index]["prt_image"];
//  else
//    imagem = snapshot.data["Custom"][index]["cli_image"];

  return CircleAvatar(
    child:
    //se imagem nula ou em branco, coloca icone padrao
    (imagem == null || imagem == 0)
        ? Icon(
      Icons.account_circle,
      size: 60,
      color: Theme.of(context).primaryColor,
    )
        :
    //container para deixar imagem circular
    Container(
      width: 60.0,
      height: 60.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(imagem),
        ),
      ),
    ),
    radius: 30,
    backgroundColor: Colors.transparent,
  );
}
