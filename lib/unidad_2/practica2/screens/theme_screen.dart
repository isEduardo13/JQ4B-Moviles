import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema'),
      ),
      body: Center(
        child: CupertinoSwitch(
          value: context.watch<ThemeProvider>().isDark,
          onChanged: (value) {
            context.read<ThemeProvider>().changeTheme();
          },
        ),
      ),
    );
  }
}
