import 'package:flutter/material.dart';

class TextPrueba extends StatelessWidget {
  const TextPrueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hola Mundo',
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
      ),
    );
  }
}
