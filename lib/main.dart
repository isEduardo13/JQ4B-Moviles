import 'package:flutter/material.dart';
import 'package:holaflutter/Unidad_1/practica_1/screens/scaffold.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deportes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      home: ScaffoldPrueba(),
    );
  }
}
