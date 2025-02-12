import 'package:flutter/material.dart';

class ListViewTileWidget extends StatelessWidget {
  const ListViewTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}

class ListTileContactWidget extends StatelessWidget {
  final String nombre;
  final String imagen;
  final double precio;
  final int stock;
  final double precioOferta;
  final bool oferta;
  const ListTileContactWidget(
      {super.key,
      required this.nombre,
      required this.stock,
      required this.precioOferta,
      required this.precio,
      required this.oferta,
      required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ClipRect(
                  child: Image.asset(
                    imagen,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(nombre),
                  Text(
                    "Precio: ${precio}",
                    style: TextStyle(
                      decoration: oferta
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Text(oferta ? "Oferta: ${precioOferta}" : ""),
                  Text(stock <= 0 ? "Agotado" : "Stock: ${stock}"),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
