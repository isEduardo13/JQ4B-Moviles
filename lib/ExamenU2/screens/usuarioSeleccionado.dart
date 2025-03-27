import 'package:flutter/material.dart';
import 'package:holaflutter/ExamenU2/models/user_random.dart';

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
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.foto),
            ),
            title: Text(user.nombreCompleto),
            subtitle: Text(user.genero),
          );
        },
      ),
    );
  }
}
