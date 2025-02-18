import 'package:flutter/material.dart';

class FocosWidget extends StatefulWidget {
  const FocosWidget({super.key});

  @override
  State<FocosWidget> createState() => _FocosWidgetState();
}

class _FocosWidgetState extends State<FocosWidget> {
  Color color = Colors.black;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          color: color,
          child: Text(""),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                contador++;

                if (contador % 2 != 0) {
                  color = Colors.yellow.shade400;
                } else {
                  color = Colors.grey;
                }
                if (contador > 12) {
                  color = Colors.red;
                }
              });
            },
            icon: Icon(
              Icons.light,
            ))
      ],
    );
  }
}
