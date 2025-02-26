import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:provider/provider.dart';

class Habitacion1Screen extends StatelessWidget {
  const Habitacion1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habitacion 1")),
      body: Center(
        child: Column(
          children: [
            Text("Habitación 1"),
            ElevatedButton(
              onPressed: () {
                context.read<DomoticaProvider>().changeLight();
              },
              child: const Text("Botón"),
            )
          ],
        ),
      ),
    );
  }
}
