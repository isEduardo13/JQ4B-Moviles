import 'package:flutter/material.dart';

class DomoticaProvider extends ChangeNotifier {
  bool _light = false;

  bool get light => _light;

  bool _light2 = false;

  bool get light2 => _light2;

  bool _door = false;
  bool get door => _door;

  void changeLight() {
    _light = !_light;
    notifyListeners();
  }

  void changeLight2() {
    _light2 = !_light2;
    notifyListeners();
  }

  void changeDoor() {
    _door = !_door;
    notifyListeners();
  }
}
