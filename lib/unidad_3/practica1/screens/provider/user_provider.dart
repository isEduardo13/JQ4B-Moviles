import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/practica1/models/UserRandom.dart';

class UserProvider extends ChangeNotifier {
  List<Userrandom> usuariosSeleccionados = [];

  List<Userrandom> get getPersonas => usuariosSeleccionados;

  void agregarUsuario(Userrandom user) {
    usuariosSeleccionados.add(user);

    notifyListeners();
  }
}
