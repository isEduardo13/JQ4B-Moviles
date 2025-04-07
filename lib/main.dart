import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:holaflutter/pantalla_principal.dart';
import 'package:holaflutter/unidad_1/practica_1/screens/scaffold.dart';
import 'package:holaflutter/unidad_2/practica1/main/scaffold_unidad2_widget.dart';
import 'package:holaflutter/unidad_2/practica1/provider/counter_provider.dart';
import 'package:holaflutter/unidad_2/practica1/provider/domotica_provider.dart';
import 'package:holaflutter/unidad_2/practica2/screens/habitacion1_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/habitacion2_screen.dart';
import 'package:holaflutter/unidad_2/practica2/screens/home_screen.dart';
import 'package:holaflutter/unidad_2/practica3/dogScreen.dart';
import 'package:holaflutter/unidad_2/practica4/PrincipalScreen.dart';
import 'package:holaflutter/unidad_2/practica4/formularioScreen.dart';
import 'package:holaflutter/unidad_2/practica4/providers/ListaPersonas_Provider.dart';
import 'package:holaflutter/unidad_3/Principal_Screen_unidad3.dart';
import 'package:holaflutter/unidad_3/authentication_practica/screens/iniciar_sesion_screen.dart';
import 'package:holaflutter/unidad_3/camara_practica/CamaraScreen.dart';
import 'package:holaflutter/unidad_3/practica_bloc/bloc/bank_account_bloc.dart';
import 'package:holaflutter/unidad_3/practica_bloc/screens/Principal.dart';
import 'package:holaflutter/unidad_3/practica1/screens/PrincipalScreen.dart';
import 'package:holaflutter/unidad_3/practica_bloc/screens/transaccion_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/actualizar_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/agregar_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/carrito_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/comprar_producto.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/eliminar_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/formulario_producto_screen.dart';
import 'package:holaflutter/unidad_3/productos_practica/Screens/productos_screen.dart';
import 'package:holaflutter/unidad_3/practica1/screens/provider/user_provider.dart';
import 'package:holaflutter/firebase_options.dart';
import 'package:holaflutter/unidad_3/productos_practica/providers/carrito_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyAppBLoc());
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
        ChangeNotifierProvider(create: (_) => DomoticaProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ListapersonasProvider()),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyAppBLoc extends StatelessWidget {
  const MyAppBLoc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BankAccountBloc(),
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
      title: "Deportes",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      routes: {
        '/principal': (context) => PantallaPrincipal(),
        '/Unidad_1': (context) => const ScaffoldPrueba(),
        '/Unidad_2': (context) => const HomeScreen(),
        '/habitacion1': (context) => const Habitacion1Screen(),
        '/habitacion2': (context) => const Habitacion2Screen(),
        '/Unidad_2_practica1': (context) => const ScaffoldUnidad2Widget(),
        '/Unidad_2_practica3': (context) => const DogScreen(),
        '/Unidad_2_practica4': (context) => const Principalscreen(),
        '/Unidad_2_practica4/agregar_persona': (context) =>
            const Formularioscreen(),
        '/Unidad_3': (context) => const PrincipalScreenUnidad3(),
        '/Unidad_3/authentication': (context) => const IniciarSesionScreen(),
        '/Unidad_3/camara': (context) => const Camarascreen(),
        '/Unidad_3/productos/agregar': (context) => const AgregarScreen(),
        '/Unidad_3/productos/actualizar': (context) => const ActualizarScreen(),
        '/Unidad_3/productos/eliminar': (context) => const EliminarScreen(),
        '/Unidad_3/productos/formulario': (context) =>
            const FormularioProductoScreen(),
        '/Unidad_3/productos/carrito': (context) => CarritoScreen(),
        '/Unidad_3/productos/detalle': (context) => const ComprarProducto(),
        '/Unidad_3/productos': (context) => const ProductosScreen(),
        '/Unidad_3/practica1': (context) => const PrincipalscreenExamen(),
        '/Unidad_3/practica_bloc': (context) => PrincipalSceen(),
        '/Unidad_3/practica_bloc/transaccion': (context) =>
            const TransaccionScreen(),
      },
      initialRoute: '/principal',
    );
  }
}
