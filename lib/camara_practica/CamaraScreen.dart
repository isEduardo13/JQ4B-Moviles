import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Camarascreen extends StatefulWidget {
  const Camarascreen({super.key});

  @override
  State<Camarascreen> createState() => CamarascreenState();
}

class CamarascreenState extends State<Camarascreen> {
  File? imagen;
  String? url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejemeplo de Camara"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      seleccionarImagenGaleria();
                    },
                    child: Text("Tomar Foto"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  imagen != null
                      ? Image.file(imagen!)
                      : const Text("Imagen no seleccionada"),
                  Text(url ?? "No hay url"),
                  ElevatedButton(
                    onPressed: () async {
                      SmartDialog.showLoading(
                        msg: "Subiendo imagen",
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
                      }
                    },
                    child: Text("Subir a cloudinary"),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future seleccionarImagenCamara() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture == null) return;
    setState(() {
      imagen = File(picture.path);
    });
  }

  Future seleccionarImagenGaleria() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    setState(() {
      imagen = File(picture.path);
    });
  }
}
