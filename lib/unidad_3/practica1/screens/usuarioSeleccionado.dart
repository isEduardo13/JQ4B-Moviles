import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/practica1/models/UserRandom.dart';

class SelectedUsersScreen extends StatelessWidget {
  final List<Userrandom> users;
  const SelectedUsersScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Usuarios")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          final user = users[i];
          return Card(
              child: Row(children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: ClipRRect(
                    child: Image.network(user.foto),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Text(user.nombreCompleto),
              ],
            ),
            SizedBox(width: 30),
            Column(
              children: [
                Text(user.email),
                Text(user.country),
                Row(
                  children: [
                    Text("PC: ${user.postcode} "),
                    Text("Phone: ${user.phone}")
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Update")),
                    ElevatedButton(onPressed: () {}, child: Text("Delete"))
                  ],
                )
              ],
            )
          ]));
        },
      ),
    );
  }
}
