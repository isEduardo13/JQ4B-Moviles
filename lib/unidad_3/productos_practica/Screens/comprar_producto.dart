import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:holaflutter/unidad_3/productos_practica/providers/carrito_provider.dart';
import 'package:holaflutter/unidad_3/productos_practica/widgets/formTextField.dart';
import 'package:provider/provider.dart';

class ComprarProducto extends StatelessWidget {
  const ComprarProducto({super.key});

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoProvider>(context);
    Product parametros = ModalRoute.of(context)!.settings.arguments as Product;
    final txtController = TextEditingController();
    final icono = Icons.add_shopping_cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprar Producto'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(parametros.imagenUrl!),
            ),
            Text(
              "Nombre: ${parametros.nombre}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text("Precio: ${parametros.precio}"),
            Text("Stock: ${parametros.stock}"),
            const SizedBox(
              height: 20,
            ),
            const Text("Cantidad a comprar"),
            const SizedBox(
              height: 20,
            ),
            FormTextField(
                horizontal: 120,
                txtController: txtController,
                icono: icono,
                prop: "la cantidad",
                inputType: TextInputType.number),
            ElevatedButton(
              onPressed: () {
                Product productoNuevo = Product(
                    id: parametros.id,
                    nombre: parametros.nombre,
                    precio: parametros.precio,
                    stock: int.parse(txtController.text));
                if (int.parse(txtController.text) > parametros.stock) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No hay suficiente stock"),
                    ),
                  );
                } else if (carrito.verifyProduct(parametros)) {
                  Product productoEnElCarro = carrito.getProduct(parametros);
                  if (productoEnElCarro.stock + productoNuevo.stock >
                      parametros.stock) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No hay suficiente stock"),
                      ),
                    );
                  } else {
                    carrito.addAmount(productoNuevo);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Producto agregado al carrito"),
                      ),
                    );
                  }
                } else {
                  carrito.addToCar(productoNuevo);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Producto agregado al carrito"),
                    ),
                  );
                }
              },
              child: const Text("Agregar al carrito"),
            ),
          ],
        ),
      ),
    );
  }
}
