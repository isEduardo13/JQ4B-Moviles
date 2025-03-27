import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:holaflutter/unidad_3/productos_practica/Services/firebase_transacciones.dart';

import '../widgets/formTextField.dart';

class AgregarScreen extends StatelessWidget {
  const AgregarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar producto"),
      ),
      body: const FormAgregarProducto(),
    );
  }
}

class FormAgregarProducto extends StatefulWidget {
  const FormAgregarProducto({super.key});

  @override
  State<FormAgregarProducto> createState() => _FormAgregarProductoState();
}

class _FormAgregarProductoState extends State<FormAgregarProducto> {
  final _formKey = GlobalKey<FormState>();
  final txtNombreController = TextEditingController();
  final txtPrecioController = TextEditingController();
  final txtStockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Datos validados correctamente'),
                    //   ),
                    // );
                    Product p = Product(
                      nombre: txtNombreController.value.text,
                      precio: double.parse(txtPrecioController.value.text),
                      stock: int.parse(txtStockController.value.text),
                    );
                    int code = await addProduct(p);
                    if (!mounted) return;
                    if (code == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Agregado correctamente'),
                        ),
                      );
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  }
                },
                child: const Text('Agregar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
