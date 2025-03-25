import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Models/product.dart';
import 'package:holaflutter/unidad_3/providers/carrito_provider.dart';
import 'package:provider/provider.dart';
import '../Services/firebase_transacciones.dart';
import '../widgets/formTextField.dart';

class ActualizarScreen extends StatelessWidget {
  const ActualizarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar producto"),
      ),
      body: const FormActualizarProductos(),
    );
  }
}

class FormActualizarProductos extends StatefulWidget {
  const FormActualizarProductos({super.key});

  @override
  State<FormActualizarProductos> createState() =>
      _FormActualizarProductosState();
}

class _FormActualizarProductosState extends State<FormActualizarProductos> {
  final _formKey = GlobalKey<FormState>();
  final txtNombreController = TextEditingController();
  final txtPrecioController = TextEditingController();
  final txtStockController = TextEditingController();
  final txtCantidadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Product parametros =
        ModalRoute.of(context)!.settings.arguments as Product;
    final idd = parametros.id;
    txtCantidadController.text = "";
    txtNombreController.text = parametros.nombre;
    txtPrecioController.text = parametros.precio.toString();
    txtStockController.text = parametros.stock.toString();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTextField(
                inputType: TextInputType.text,
                txtController: txtNombreController,
                icono: Icons.add_to_home_screen_rounded,
                prop: 'nombre'),
            FormTextField(
                inputType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                txtController: txtPrecioController,
                icono: Icons.currency_exchange,
                prop: 'precio'),
            FormTextField(
                inputType: TextInputType.number,
                txtController: txtStockController,
                icono: Icons.swap_vert_circle_outlined,
                prop: 'stock'),
            Center(
              child: Wrap(children: [
                FormTextField(
                    txtController: txtCantidadController,
                    icono: Icons.shopping_bag,
                    prop: 'la cantidad',
                    inputType: TextInputType.number),
                OutlinedButton(
                    onPressed: () {
                      if (int.parse(txtCantidadController.text) >=
                          parametros.stock) {
                      } else {
                        Product p = Product(
                            id: idd,
                            nombre: txtNombreController.value.text,
                            precio:
                                double.parse(txtPrecioController.value.text),
                            stock: int.parse(txtStockController.value.text));
                        context.read<CarritoProvider>().addToCar(p);
                      }
                    },
                    child: Text("Agregar al carrito")),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Datos validados correctamente'),
                      //   ),
                      // );
                      Product p = Product(
                          id: idd,
                          nombre: txtNombreController.value.text,
                          precio: double.parse(txtPrecioController.value.text),
                          stock: int.parse(txtStockController.value.text));
                      int code = await updateProducto(p);
                      if (!mounted) return;
                      if (code == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Actualizado correctamente'),
                          ),
                        );
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      }
                    }
                  },
                  child: const Text('Actualizar'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/eliminar',
                        arguments: parametros);
                  },
                  child: const Text('Eliminar'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
