import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text("Login"),
                accountEmail: Text("E-maillogin@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: ExactAssetImage("images/leleto.jpg"),
                ),
              ),

              ListTile(
                leading: Icon(Icons.work),
                title: Text("Tornar-se um prestador"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Editar Perfil"),
                onTap: (){},
              ),
              Divider(
                color: Colors.black,

              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                onTap: (){},
              )
            ]
        ),
      ),
      appBar: AppBar(
        title: Text("DRAWER"),
      ),
    );

  }
}
