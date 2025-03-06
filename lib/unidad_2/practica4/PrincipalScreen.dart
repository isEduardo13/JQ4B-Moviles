import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica4/models/persona.dart';
import 'package:holaflutter/unidad_2/practica4/providers/ListaPersonas_Provider.dart';
import 'package:provider/provider.dart';

class Principalscreen extends StatelessWidget {
  const Principalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListapersonasWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/formulario');
          },
          child: const Text("+")),
    );
  }
}

class ListapersonasWidget extends StatefulWidget {
  const ListapersonasWidget({super.key});

  @override
  State<ListapersonasWidget> createState() => _ListapersonasWidgetState();
}

class _ListapersonasWidgetState extends State<ListapersonasWidget> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<ListapersonasProvider>().personas.isEmpty) {
      return const Center(
        child: Text("No hay personas"),
      );
    }
    return ListView.builder(
        itemCount: context.watch<ListapersonasProvider>().personas.length,
        itemBuilder: (context, index) {
          Persona p = context.watch<ListapersonasProvider>().personas[index];
          return ListTile(
            title: Text(p.nombre),
            subtitle: Text(p.telefono),
            leading: CircleAvatar(
              child: Text(p.nombre[0]),
            ),
          );
        });
  }
}
