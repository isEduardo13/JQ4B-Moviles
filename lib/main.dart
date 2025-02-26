import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/counter_provider.dart';
import 'package:holaflutter/unidad_2/practica1/provider/theme_provider.dart';
import 'package:holaflutter/unidad_2/practica2/screens/contact_screens.dart';
import 'package:holaflutter/unidad_2/practica2/screens/home_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/theme_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      // title: "Deportes",
      debugShowCheckedModeBanner: false,
      // theme: themeProvider.currentTheme,
      // theme: ThemeData(
      //     useMaterial3: true,
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      // home:
      //    //ScaffoldPrueba()
      //     //ScaffoldUnidad2Widget(),
      //
      routes: {
        '/': (_) => HomeScreen(),
        '/contactos': (_) => const ContactScreen(),
        '/tema': (_) => const ThemeScreen(),
      },
      initialRoute: '/contactos',
    );
  }
}
