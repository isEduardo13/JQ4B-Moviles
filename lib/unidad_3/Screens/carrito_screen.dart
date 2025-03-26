import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Models/product.dart';
import 'package:holaflutter/unidad_3/providers/carrito_provider.dart';
import 'package:provider/provider.dart';

class CarritoScreen extends StatelessWidget {
  CarritoScreen({super.key});

  List<Product> productos = [];

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoProvider>(context);
    productos = carrito.getProductos;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito de compras"),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(productos[index].nombre),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Precio: ${productos[index].precio}"),
              Text("Cantidad: ${productos[index].stock}"),
            ],
          ),
        ),
      ),
    );
  }
}
