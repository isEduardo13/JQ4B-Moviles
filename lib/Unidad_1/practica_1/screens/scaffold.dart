import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/Ejercicio1.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/cardwidget.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/columnwidget.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/container_widget.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/listTileWidget.dart';

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
      body: SingleChildScrollView(
          child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
            CardWidget(),
            ColumnWidget(),
            WidgetPersonalizado(),
            ListTileWidget(),
            ContainerWidget(fondo: Colors.blue, texto: "Hola")
          ])
          //ListViewBuilderWidget()
          //ListViewTileWidget()
          //ListViewWidget(),
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
