import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormTextField extends StatelessWidget {
  FormTextField({
    super.key,
    required this.txtController,
    required this.icono,
    required this.prop,
    required this.inputType,
    this.horizontal = 15,
  });
  double horizontal;
  final String prop;
  final TextEditingController txtController;
  final IconData icono;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    double horizontal = this.horizontal;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: horizontal),
      child: TextFormField(
        keyboardType: inputType,
        controller: txtController,
        decoration: InputDecoration(
          hintText: 'Ingrese $prop',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon: Icon(icono),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido';
          }
          return null;
        },
      ),
    );
  }
}
