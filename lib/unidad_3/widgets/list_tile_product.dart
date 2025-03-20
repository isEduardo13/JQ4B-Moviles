import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Models/product.dart';
import 'package:holaflutter/unidad_3/Services/firebase_transacciones.dart';

class ListTileProduct extends StatelessWidget {
  const ListTileProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product>? productos = snapshot.data;
            return ListView.builder(
                itemCount: productos!.length,
                itemBuilder: (context, index) {
                  Product p = productos[index];
                  return ListTile(
                    title: Text(p.nombre),
                    subtitle: Text("Stock: ${p.stock} Precio: ${p.precio}"),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        });
  }
}
