import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:holaflutter/unidad_3/productos_practica/Services/firebase_transacciones.dart';

class EliminarScreen extends StatelessWidget {
  const EliminarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product parametros =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Esta seguro que desea eliminar el registro'),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () async {
                int code = await deleteProducto(parametros.id!);
                if (code == 200 && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Eliminado correctamente'),
                    ),
                  );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/Unidad_3/productos', (route) => false);
                }
              },
              child: const Text('Eliminar'),
            ),
          )
        ],
      ),
    );
  }
}
