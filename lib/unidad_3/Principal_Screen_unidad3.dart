import 'package:flutter/material.dart';

class PrincipalScreenUnidad3 extends StatelessWidget {
  const PrincipalScreenUnidad3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unidad 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pantalla Principal Unidad 3'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Unidad_3/authentication');
              },
              child: const Text('Ir a Autenticación'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Unidad_3/camara');
              },
              child: const Text('Ir a Camara'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Unidad_3/productos');
              },
              child: const Text('Ir a Productos'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Unidad_3/practica1');
                },
                child: const Text('Practica 1')),
          ],
        ),
      ),
    );
  }
}
