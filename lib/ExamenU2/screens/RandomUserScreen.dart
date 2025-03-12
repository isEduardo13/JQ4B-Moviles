import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:holaflutter/ExamenU2/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/UserRandom.dart';

class RandomUserScreen extends StatelessWidget {
  const RandomUserScreen({super.key});

  Future<Userrandom> fetchUser() async {
    final response = await http.get(Uri.parse("https://randomuser.me/api/"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Userrandom.fromJson(data);
    }
    throw Exception('Error al obtener usuario');
  }

  @override
  Widget build(BuildContext context) {
    final lista = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
      ),
      body: FutureBuilder<Userrandom>(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userrandom = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userrandom.foto),
                ),
                const SizedBox(height: 10),
                Text(
                  userrandom.nombreCompleto,
                  style: const TextStyle(fontSize: 21),
                ),
                Text(
                  userrandom.genero,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text("Agregar"),
                      onPressed: () {
                        Userrandom persona = Userrandom(
                          nombreCompleto: userrandom.nombreCompleto,
                          genero: userrandom.genero,
                          foto: userrandom.foto,
                        );
                        lista.agregarUsuario(persona);
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Otro usuario"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RandomUserScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          }
          return const Center(child: Text("Cargando..."));
        },
      ),
    );
  }
}
