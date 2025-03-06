import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica4/models/persona.dart';

class ListapersonasProvider extends ChangeNotifier {
  List<Persona> personas = [];

  List<Persona> get getPersonas => personas;

  void addPersona(Persona p) {
    personas.add(p);

    notifyListeners();
  }
}
