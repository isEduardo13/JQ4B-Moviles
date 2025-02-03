import 'package:flutter/material.dart';

class WidgetPersonalizado extends StatelessWidget {
  const WidgetPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          FlutterLogo(
            size: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bluetooth,
                color: Colors.red,
                size: 35,
              ),
              Icon(
                Icons.safety_check_outlined,
                color: Colors.amber,
                size: 35,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eduardo Isidro Hernandez",
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "Ingenieria \n en sistemas \n computacionales",
                style: TextStyle(color: Colors.deepPurpleAccent),
              )
            ],
          )
        ],
      ),
    );
  }
}
