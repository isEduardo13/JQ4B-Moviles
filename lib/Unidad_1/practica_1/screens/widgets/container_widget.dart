import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color fondo;
  final String texto;
  const ContainerWidget({super.key, required this.fondo, required this.texto});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: fondo,
      width: 100,
      height: 100,
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
