import 'package:flutter/material.dart';

import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/resultados.dart';
import 'package:holaflutter/unidad_2/practica2/widgets/drawerwidget.dart';

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
