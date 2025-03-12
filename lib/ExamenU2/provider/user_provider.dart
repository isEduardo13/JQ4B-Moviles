import 'package:flutter/material.dart';
import 'package:holaflutter/ExamenU2/models/UserRandom.dart';

class UserProvider extends ChangeNotifier {
  List<Userrandom> usuariosSeleccionados = [];

  List<Userrandom> get getPersonas => usuariosSeleccionados;

  void agregarUsuario(Userrandom user) {
    usuariosSeleccionados.add(user);

    notifyListeners();
  }
}
