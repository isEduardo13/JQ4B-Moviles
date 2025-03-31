import 'dart:io';

import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';
import 'package:image_picker/image_picker.dart';
import '../Services/firebase_transacciones.dart';
import '../widgets/formTextField.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  File? imagen;
  String? url;
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
    String? parametrosImagen = parametros.imagenUrl;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            parametrosImagen != null
                ? Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.transparent,
                          child: Image(image: NetworkImage(parametrosImagen)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            seleccionarImagenGaleria();
                          },
                          child: Icon(Icons.add_a_photo_rounded),
                        ),
                        imagen != null
                            ? const SizedBox(
                                height: 10,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 100,
                    width: 100,
                  ),
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
                      if (url != null) {
                        parametrosImagen = url;
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
                          parametrosImagen = url;
                        } else {
                          url = "Error al subir imagen";
                          return;
                        }
                      }

                      Product p = Product(
                        id: idd,
                        nombre: txtNombreController.value.text,
                        precio: double.parse(txtPrecioController.value.text),
                        stock: int.parse(txtStockController.value.text),
                        imagenUrl: parametrosImagen,
                      );
                      int code = await updateProducto(p);
                      if (!mounted) return;
                      if (code == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Actualizado correctamente'),
                          ),
                        );
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/Unidad_3/productos', (route) => false);
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
                    Navigator.pushNamed(context, '/Unidad_3/productos/eliminar',
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

  Future seleccionarImagenGaleria() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    setState(() {
      imagen = File(picture.path);
    });
  }
}
