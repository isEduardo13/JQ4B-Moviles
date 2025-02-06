import 'package:flutter/material.dart';

class cardWidget extends StatelessWidget {
  const cardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset("assets/images/Fondo.png"),
          ),
        ]),
      ),
    );
  }
}
