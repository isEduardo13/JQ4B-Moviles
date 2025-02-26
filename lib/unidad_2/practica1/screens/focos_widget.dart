import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class FocosWidget extends StatefulWidget {
  const FocosWidget({super.key});

  @override
  State<FocosWidget> createState() => _FocosWidgetState();
}

class _FocosWidgetState extends State<FocosWidget> {
  Color color = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          color: color,
          child: Text(context.watch<CounterProvider>().counter.toString()),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                int counterProvider = context.read<CounterProvider>().counter;
                int counter = counterProvider;
                context.read<CounterProvider>().increment();
                if (counter % 2 != 0) {
                  color = Colors.yellow.shade400;
                } else {
                  color = Colors.grey;
                }
                if (counter > 12) {
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
