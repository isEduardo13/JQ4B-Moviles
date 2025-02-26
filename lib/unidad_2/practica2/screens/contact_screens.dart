import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});
  static String routeName = '/contactos';

  @override
  State<ContactScreen> createState() => ThemeScreenState();
}

class ThemeScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/tema');
          },
          child: Text("Ir a tema"),
        ),
      ),
    );
  }
}
