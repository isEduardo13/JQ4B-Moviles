import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Services/firebase_transacciones.dart';

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
              Navigator.pushNamed(context, '/carrito');
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
                  subtitle: Text(
                      snapshot.data?[index].precio.toString() ?? "sin precio"),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () => {
                    Navigator.pushNamed(context, '/detalle',
                        arguments: snapshot.data?[index])
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.shopping_cart),
                  ),
                  onLongPress: () {
                    Navigator.pushNamed(context, '/actualizar',
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
          Navigator.pushNamed(context, "/agregar"),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
