import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/Ejercicio1.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/cardwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/columnwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/drawerwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listTileWidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listview_builder_widget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listview_tile_widget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listviewwidget.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/resultados.dart';

class ScaffoldPrueba extends StatelessWidget {
  const ScaffoldPrueba({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Deportes"),
            SizedBox(width: 50),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            SizedBox(width: 50),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: ResultadosWidget()
          //ListViewBuilderWidget()
          //ListViewTileWidget()
          //ListViewWidget(),
          ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
