import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:holaflutter/unidad_2/practica2/widgets/drawerwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          children: [
            Text("habitación 1"),
            Icon(
              Icons.lightbulb,
              size: 100,
              color: context.watch<DomoticaProvider>().light == true
                  ? Colors.yellow
                  : Colors.grey,
            ),
            Text("habitación 2"),
            Icon(
              Icons.lightbulb,
              size: 100,
              color: context.watch<DomoticaProvider>().light2 == true
                  ? Colors.yellow
                  : Colors.grey,
            ),
            Text(
              context.watch<DomoticaProvider>().door == true
                  ? "Puerta abierta"
                  : "Puerta cerrada",
              style: TextStyle(
                fontSize: 20,
                color: context.watch<DomoticaProvider>().door == true
                    ? Colors.green
                    : Colors.red,
              ),
            )
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
            label: 'Practica 1',
            onTap: () => Navigator.pushNamed(context, '/Unidad_2_practica1'),
          ),
          SpeedDialChild(
            child: Icon(Icons.mode_standby_outlined, color: Colors.white),
            backgroundColor: Colors.orange,
            label: 'practica 3',
            onTap: () => Navigator.pushNamed(context, '/Unidad_2_practica3'),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: Colors.purple,
            label: 'practica 4',
            onTap: () => Navigator.pushNamed(context, '/Unidad_2_practica4'),
          ),
        ],
      ),
    );
  }
}
