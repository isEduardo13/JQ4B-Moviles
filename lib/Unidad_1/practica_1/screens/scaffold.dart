import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/Ejercicio1.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/cardwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/columnwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listTileWidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listviewwidget.dart';

class ScaffoldPrueba extends StatelessWidget {
  const ScaffoldPrueba({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Primera pantalla de flutter ',
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListViewWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
