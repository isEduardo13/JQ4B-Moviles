import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/screens/focos_widget.dart';

class ScaffoldUnidad2Widget extends StatelessWidget {
  const ScaffoldUnidad2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unidad 2'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: FocosWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
