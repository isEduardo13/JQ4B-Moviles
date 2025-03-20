import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/rowwidget.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ContainerWidget(
        //   fondo: Colors.deepOrange.shade300,
        //   texto: "Hola mundooooo",
        // ),
        RowWidget()
      ],
    );
  }
}
