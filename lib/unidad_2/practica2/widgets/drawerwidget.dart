import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/habitacion1');
            },
            child: const Text("habitacion 1"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/habitacion2');
            },
            child: const Text("habitacion 2"),
          ),

          MaterialButton(
            onPressed: () {
              context.read<DomoticaProvider>().changeDoor();
            },
            child: Text(
                context.watch<DomoticaProvider>().door == false
                    ? "Cerrar puerta"
                    : "Abrir puerta",
                style: TextStyle(
                  fontSize: 20,
                  color: context.watch<DomoticaProvider>().door == false
                      ? Colors.green
                      : Colors.red,
                )),
          )

          // UserAccountsDrawerHeader(
          //   accountName: Text("Eduardo Isidro Hernandez"),
          //   accountEmail: Text("eduardoisidroh13@gmail.com"),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundColor: Colors.green.shade200,
          //     child: Text("EI"),
          //   ),
          //   // decoration: BoxDecoration(gradient: RadialGradient(colors: [])),
          //   // otherAccountsPictures: [FlutterLogo()],
          // ),
          // ListTile(
          //   leading: Icon(Icons.home_filled),
          //   title: Text("Inicio"),
          // ),
          // ListTile(
          //   title: Text("Buscar"),
          //   leading: Icon(Icons.search),
          // ),
          // Divider(),
          // ListTile(
          //   title: Text("Cerrar sesión"),
          //   leading: Icon(Icons.logout_rounded),
          // ),
        ],
      ),
    );
  }
}
