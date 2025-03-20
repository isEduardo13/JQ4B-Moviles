import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_1/practica_1/models/alumno.dart';
import 'package:holaflutter/unidad_1/practica_1/models/producto.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/widgets/listview_tile_widget.dart';

class ListViewBuilderWidget extends StatelessWidget {
  ListViewBuilderWidget({super.key});
  final List<Producto> _productos = [
    Producto(
        nombre: "Cargador",
        stock: 20,
        precioOferta: 200,
        precio: 450,
        oferta: false,
        imagen: "assets/images/cargador.png"),
    Producto(
        nombre: "Fuente de poder",
        stock: 20,
        precioOferta: 200,
        precio: 450,
        oferta: true,
        imagen: "assets/images/fuente.png"),
    Producto(
        nombre: "Ventilador",
        stock: 20,
        precioOferta: 200,
        precio: 450,
        oferta: false,
        imagen: "assets/images/ventilador.png"),
    Producto(
        nombre: "Laptop",
        stock: 20,
        precioOferta: 200,
        precio: 450,
        oferta: true,
        imagen: "assets/images/laptop.png"),
    Producto(
        nombre: "Procesador Ryzen 7",
        stock: 0,
        precioOferta: 200,
        precio: 450,
        oferta: false,
        imagen: "assets/images/procesador.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          Producto p = _productos[index];
          return ListTileContactWidget(
            nombre: p.nombre,
            imagen: p.imagen,
            oferta: p.oferta,
            precio: p.precio,
            precioOferta: p.precioOferta,
            stock: p.stock,
          );
        });
  }
}
