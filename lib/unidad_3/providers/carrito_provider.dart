import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Models/product.dart';

class CarritoProvider extends ChangeNotifier {
  List<Product> productos = [];

  List<Product> get getProductos => productos;

  void addToCar(Product p) {
    productos.add(p);

    notifyListeners();
  }
}
