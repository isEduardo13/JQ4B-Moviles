import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:holaflutter/unidad_2/practica1/provider/theme_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});
  static String routeName = '/contactos';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Theme(
      data: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contactos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Contactos"),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tema');
                },
                child: const Text("Ir a tema"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
