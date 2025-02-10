import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/models/alumno.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/widgets/listview_tile_widget.dart';

class ListViewBuilderWidget extends StatelessWidget {
  ListViewBuilderWidget({super.key});
  final List<Alumno> _personas = [
    Alumno(
        nombre: "Eduardo",
        carrera: "Sistemas",
        numeroControl: "21TE0273",
        apellido: "Isidro"),
    Alumno(
        nombre: "Cristian",
        carrera: "Ovalle",
        numeroControl: "21TE0273",
        apellido: "Isidro"),
    Alumno(
        nombre: "Jafit",
        carrera: "Gestion",
        numeroControl: "21TE0273",
        apellido: "Perez"),
    Alumno(
        nombre: "Felix",
        carrera: "H",
        numeroControl: "21TE0273",
        apellido: "Rivera"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (context, index) {
          Alumno p = _personas[index];
          return ListTileContactWidget(
              nombre: p.nombre,
              carrera: p.carrera,
              numeroControl: p.numeroControl,
              apellido: p.apellido);
        });
  }
}
