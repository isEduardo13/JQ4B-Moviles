import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/models/persona.dart';
import 'package:holaflutter/unidad_2/practica4/textbox_widget.dart';

class Formularioscreen extends StatefulWidget {
  const Formularioscreen({super.key});

  @override
  State<Formularioscreen> createState() => _FormularioscreenState();
}

class _FormularioscreenState extends State<Formularioscreen> {
  final txtNomController = TextEditingController();
  final txtTelController = TextEditingController();
  final txtSexController = TextEditingController();
  Persona p = Persona(nombre: "", telefono: "", sexo: "");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
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
                  txtcontroller: txtNomController,
                  icon: Icons.person,
                  type: TextInputType.text,
                  isPassword: false,
                ),
                TextboxWidget(
                  prop: "Telefono",
                  txtcontroller: txtTelController,
                  icon: Icons.phone,
                  type: TextInputType.phone,
                  isPassword: false,
                ),
                TextboxWidget(
                  prop: "Sexo",
                  txtcontroller: txtSexController,
                  icon: Icons.gesture_rounded,
                  type: TextInputType.text,
                  isPassword: false,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          p = Persona(
                              nombre: txtNomController.text,
                              telefono: txtTelController.text,
                              sexo: txtSexController.text);
                        });
                      }
                    },
                    child: Text("Ingresar")),
                Text(p.nombre),
                Text(p.telefono),
              ],
            )),
      )),
    );
  }
}
