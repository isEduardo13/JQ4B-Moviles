import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Models/product.dart';

class CarritoProvider extends ChangeNotifier {
  List<Product> productos = [];

  List<Product> get getProductos => productos;

  bool verifyProduct(Product p) {
    for (var i = 0; i < productos.length; i++) {
      if (productos[i].id == p.id) {
        return true;
      }
    }
    return false;
  }

  Product getProduct(Product p) {
    for (var i = 0; i < productos.length; i++) {
      if (productos[i].id == p.id) {
        return productos[i];
      }
    }
    return Product(nombre: "", precio: 0, stock: 0);
  }

  bool addAmount(Product p) {
    for (var i = 0; i < productos.length; i++) {
      if (productos[i].id == p.id) {
        productos[i].stock += p.stock;
        return true;
      }
    }
    return false;
  }

  void addToCar(Product p) {
    if (verifyProduct(p)) {
      notifyListeners();
      return;
    } else {
      productos.add(p);
    }
    notifyListeners();
  }

  void removeFromCar(Product p) {
    productos.remove(p);
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (var i = 0; i < productos.length; i++) {
      total += productos[i].precio * productos[i].stock;
    }
    return total;
  }
}
