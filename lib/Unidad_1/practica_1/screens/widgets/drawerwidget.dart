import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Eduardo Isidro Hernandez"),
            accountEmail: Text("eduardoisidroh13@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green.shade200,
              child: Text("EI"),
            ),
            // decoration: BoxDecoration(gradient: RadialGradient(colors: [])),
            // otherAccountsPictures: [FlutterLogo()],
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Inicio"),
          ),
          ListTile(
            title: Text("Buscar"),
            leading: Icon(Icons.search),
          ),
          Divider(),
          ListTile(
            title: Text("Cerrar sesión"),
            leading: Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
