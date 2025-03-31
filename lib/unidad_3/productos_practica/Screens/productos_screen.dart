import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/Services/firebase_transacciones.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});
  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/Unidad_3/productos/carrito');
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index].nombre ?? "sin nombre"),
                  subtitle: Row(children: [
                    Column(children: [
                      Text("precio: "),
                      const SizedBox(width: 5),
                      Text(snapshot.data?[index].precio.toString() ??
                          "sin precio"),
                    ]),
                    const SizedBox(width: 10),
                    Column(children: [
                      Text("stock: "),
                      const SizedBox(width: 5),
                      Text(snapshot.data?[index].stock.toString() ??
                          "sin stock"),
                    ]),
                  ]),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () => {
                    Navigator.pushNamed(context, '/Unidad_3/productos/detalle',
                        arguments: snapshot.data?[index])
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Image(
                        image: NetworkImage(
                            snapshot.data?[index].imagenUrl ?? "Sin imagen")),
                  ),
                  onLongPress: () {
                    Navigator.pushNamed(
                        context, '/Unidad_3/productos/actualizar',
                        arguments: snapshot.data?[index]);
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, "/Unidad_3/productos/agregar"),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
