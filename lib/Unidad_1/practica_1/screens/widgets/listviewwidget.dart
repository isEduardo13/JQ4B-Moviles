import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/cardwidget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardWidget(),
        CardWidget(),
        CardWidget(),
        CardWidget(),
      ],
    );
  }
}
