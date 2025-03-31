import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:holaflutter/unidad_3/productos_practica/Services/firebase_transacciones.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
  File? imagen;
  String? url;
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
              child: const Text(
                'Agrega una imagen',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  seleccionarImagenGaleria();
                },
                child: Icon(Icons.add_a_photo_rounded),
              ),
            ),
            imagen != null
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox(),
            imagen != null
                ? Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(imagen!),
                    ),
                  )
                : Center(child: const Text("")),
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
                    if (imagen == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sube una imagen primero'),
                        ),
                      );
                      return;
                    }
                    if (imagen != null) {
                      SmartDialog.showLoading(
                        msg: "Agregando producto...",
                      );
                      final urlCloudinary = Uri.parse(
                          'https://api.cloudinary.com/v1_1/dtukfceon/upload');
                      final request =
                          http.MultipartRequest('POST', urlCloudinary)
                            ..fields['upload_preset'] = 'jq47b-2025'
                            ..files.add(await http.MultipartFile.fromPath(
                                'file', imagen!.path));

                      final response = await request.send();

                      if (response.statusCode == 200) {
                        final reponseData = await response.stream.toBytes();
                        final responseString =
                            String.fromCharCodes(reponseData);
                        final json = jsonDecode(responseString);
                        setState(() {
                          url = json['url'];
                          SmartDialog.dismiss();
                        });
                      } else {
                        url = "Error al subir imagen";
                        return;
                      }
                    }

                    Product p = Product(
                      nombre: txtNombreController.value.text,
                      precio: double.parse(txtPrecioController.value.text),
                      stock: int.parse(txtStockController.value.text),
                      imagenUrl: url,
                    );
                    int code = await addProduct(p);
                    if (!mounted) return;
                    if (code == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Agregado correctamente'),
                        ),
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/Unidad_3/productos', (route) => false);
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

  Future seleccionarImagenGaleria() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    setState(() {
      imagen = File(picture.path);
    });
  }
}
