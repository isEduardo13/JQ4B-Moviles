import 'package:flutter/material.dart';

class rowWidget extends StatelessWidget {
  const rowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   Icons.umbrella,
          //   color: Colors.amber,
          //   size: 90,
          // ),
          // Icon(
          //   Icons.access_time,
          //   color: Colors.purple,
          // ),
          // Icon(
          //   Icons.safety_check_outlined,
          //   color: Colors.deepPurple,
          // ),
          // Icon(
          //   Icons.snapchat,
          //   color: Colors.blueGrey,
          // )
          FlutterLogo(
            size: 180,
          )
        ],
      ),
    );
  }
}
