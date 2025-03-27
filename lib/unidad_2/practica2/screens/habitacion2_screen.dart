import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:provider/provider.dart';

class Habitacion2Screen extends StatelessWidget {
  const Habitacion2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habitacion 2")),
      body: Center(
        child: Column(
          children: [
            Text("Habitación 2"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<DomoticaProvider>().changeLight2();
              },
              child: const Text("Botón"),
            )
          ],
        ),
      ),
    );
  }
}
