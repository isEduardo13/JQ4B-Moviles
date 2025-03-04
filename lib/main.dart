import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica1/provider/counter_provider.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:holaflutter/unidad_2/practica1/provider/theme_provider.dart';
import 'package:holaflutter/unidad_2/practica2/screens/contact_screens.dart';
import 'package:holaflutter/unidad_2/practica2/screens/habitacion1_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/habitacion2_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/home_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/theme_screen.dart';
import 'package:holaflutter/unidad_2/practica3/dogScreen.dart';
import 'package:holaflutter/unidad_2/practica4/formularioScreen.dart';
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
        ChangeNotifierProvider(create: (_) => DomoticaProvider()),
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
        '/': (_) => Formularioscreen(),
        '/contactos': (_) => const ContactScreen(),
        '/tema': (_) => const ThemeScreen(),
        '/habitacion1': (_) => const Habitacion1Screen(),
        '/habitacion2': (_) => const Habitacion2Screen(),
      },
      initialRoute: '/',
    );
  }
}
