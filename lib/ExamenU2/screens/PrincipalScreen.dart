import 'package:flutter/material.dart';
import 'package:holaflutter/ExamenU2/provider/user_provider.dart';
import 'package:holaflutter/ExamenU2/screens/RandomUserScreen.dart';
import 'package:holaflutter/ExamenU2/screens/usuarioSeleccionado.dart';
import 'package:provider/provider.dart';

class PrincipalscreenExamen extends StatefulWidget {
  const PrincipalscreenExamen({super.key});

  @override
  State<PrincipalscreenExamen> createState() => _PrincipalscreenState();
}

class _PrincipalscreenState extends State<PrincipalscreenExamen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Examen U2"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SelectedUsersScreen(users: userProvider.getPersonas),
                ),
              );
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Eduardo Isidro Hernandez \n'
          'Edgar Jafet Perez Juarez',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add),
        onPressed: () async {
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RandomUserScreen()),
          );

          if (nuevoUsuario != null) {
            userProvider.agregarUsuario(nuevoUsuario);
          }
        },
      ),
    );
  }
}
