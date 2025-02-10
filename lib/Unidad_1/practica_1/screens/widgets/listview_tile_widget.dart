import 'package:flutter/material.dart';

class ListViewTileWidget extends StatelessWidget {
  const ListViewTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}

class ListTileContactWidget extends StatelessWidget {
  final String nombre;
  final String numeroControl;
  final String carrera;
  final String apellido;
  const ListTileContactWidget(
      {super.key,
      required this.nombre,
      required this.numeroControl,
      required this.apellido,
      required this.carrera});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(nombre.toString().substring(0, 1).toUpperCase() +
            apellido.toString().substring(0, 1).toUpperCase()),
      ),
      title: Text(
        nombre,
        style: TextStyle(
            color: carrera == "Sistemas" ? Colors.green : Colors.black),
      ),
      subtitle: Column(
        children: [
          Text(numeroControl),
          Icon(carrera == "Sistemas" ? Icons.computer : Icons.no_accounts)
        ],
      ),
    );
  }
}
