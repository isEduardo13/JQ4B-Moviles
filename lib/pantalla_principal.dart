import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      body: Center(
        child: Text('Bienvenido a la pantalla principal'),
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
            onTap: () => Navigator.pushNamed(context, '/Unidad_1'),
          ),
          SpeedDialChild(
            child: Icon(Icons.mode_standby_outlined, color: Colors.white),
            backgroundColor: Colors.orange,
            label: 'Unidad 2',
            onTap: () => Navigator.pushNamed(context, '/Unidad_2'),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.purple,
            label: 'unidad 3',
            onTap: () => Navigator.pushNamed(context, '/Unidad_3'),
          ),
          SpeedDialChild(
            child: Icon(Icons.notifications, color: Colors.white),
            backgroundColor: Colors.red,
            label: 'Notificaciones',
            onTap: () =>
                Navigator.pushNamed(context, '/Unidad_X/notificaciones'),
          ),
        ],
      ),
    );
  }
}
