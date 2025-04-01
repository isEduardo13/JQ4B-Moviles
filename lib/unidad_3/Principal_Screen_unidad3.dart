import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
            const Text('Unidad 3'),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        spaceBetweenChildren: 40,
        children: [
          SpeedDialChild(
            child: Icon(Icons.home, color: Colors.white),
            backgroundColor: Colors.green,
            label: 'Unidad 1',
            onTap: () =>
                Navigator.pushNamed(context, '/Unidad_3/authentication'),
          ),
          SpeedDialChild(
            child: Icon(Icons.mode_standby_outlined, color: Colors.white),
            backgroundColor: Colors.orange,
            label: 'Unidad 2',
            onTap: () => Navigator.pushNamed(context, '/Unidad_3/camara'),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.purple,
            label: 'unidad 3',
            onTap: () => Navigator.pushNamed(context, '/Unidad_3/productos'),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.purple,
            label: 'Practica 1',
            onTap: () => Navigator.pushNamed(context, '/Unidad_3/practica1'),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.purple,
            label: 'Practica Bloc',
            onTap: () =>
                Navigator.pushNamed(context, '/Unidad_3/practica_bloc'),
          ),
        ],
      ),
    );
  }
}
