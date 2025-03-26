import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/Screens/actualizar_screen.dart';
import 'package:holaflutter/unidad_3/Screens/agregar_screen.dart';
import 'package:holaflutter/unidad_3/Screens/carrito_screen.dart';
import 'package:holaflutter/unidad_3/Screens/comprar_producto.dart';
import 'package:holaflutter/unidad_3/Screens/eliminar_screen.dart';
import 'package:holaflutter/unidad_3/Screens/productos_screen.dart';
import 'package:holaflutter/unidad_3/practica1/screens/provider/user_provider.dart';
import 'package:holaflutter/firebase_options.dart';
import 'package:holaflutter/unidad_3/providers/carrito_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}
// void main() {
//   return runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
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
        '/': (context) => const ProductosScreen(),
        '/agregar': (context) => const AgregarScreen(),
        '/actualizar': (context) => const ActualizarScreen(),
        '/eliminar': (context) => const EliminarScreen(),
        '/carrito': (context) => CarritoScreen(),
        '/detalle': (context) => const ComprarProducto(),
      },
      initialRoute: '/',
    );
  }
}
