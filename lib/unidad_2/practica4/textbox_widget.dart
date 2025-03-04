import 'package:flutter/material.dart';

class TextboxWidget extends StatelessWidget {
  final String prop;
  final TextEditingController txtcontroller;
  final IconData icon;
  final TextInputType type;
  final bool isPassword;

  const TextboxWidget(
      {super.key,
      required this.prop,
      required this.txtcontroller,
      required this.icon,
      required this.type,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: isPassword,
        controller: txtcontroller,
        keyboardType: type,
        decoration: InputDecoration(
            hintText: "Ingrese  $prop",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: prop,
            suffixIcon: Icon(icon)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese $prop';
          }
          return null;
        },
      ),
    );
  }
}
