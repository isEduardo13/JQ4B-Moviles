import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: CircleAvatar(
          child: Text("E"),
        ),
        title: Text("Eduardo"),
        subtitle: Text("Eduardo@gmail.com"),
        trailing: Icon(Icons.arrow_right_alt_sharp),
      ),
    );
  }
}
