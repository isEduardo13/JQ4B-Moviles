import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica4/textbox_widget.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:holaflutter/unidad_3/productos_practica/Services/firebase_transacciones.dart';

class FormularioProductoScreen extends StatefulWidget {
  const FormularioProductoScreen({super.key});

  @override
  State<FormularioProductoScreen> createState() =>
      _FormularioProductoScreenState();
}

class _FormularioProductoScreenState extends State<FormularioProductoScreen> {
  final nombreController = TextEditingController();
  final stockController = TextEditingController();
  final precioController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Producto"),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextboxWidget(
                  prop: "Nombre",
                  txtcontroller: nombreController,
                  icon: Icons.person,
                  type: TextInputType.text,
                  isPassword: false,
                ),
                TextboxWidget(
                  prop: "Stock",
                  txtcontroller: stockController,
                  icon: Icons.phone,
                  type: TextInputType.number,
                  isPassword: false,
                ),
                TextboxWidget(
                  prop: "Precio",
                  txtcontroller: precioController,
                  icon: Icons.gesture_rounded,
                  type: TextInputType.number,
                  isPassword: false,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Product producto = Product(
                          nombre: nombreController.text,
                          stock: int.parse(stockController.text),
                          precio: double.parse(precioController.text),
                        );
                        int codigo = await addProduct(producto);
                        if (codigo == 200) {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil("/", (route) => false);
                        }
                      }
                    },
                    child: Text("Guardar"))
              ],
            )),
      )),
    );
  }
}
