import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holaflutter/ExamenU2/provider/user_provider.dart';
import 'package:holaflutter/ExamenU2/screens/PrincipalScreen.dart';
import 'package:holaflutter/ExamenU2/screens/RandomUserScreen.dart';
import 'package:holaflutter/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
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
        '/': (_) => PrincipalscreenExamen(),
        'RandomUserScreen': (_) => const RandomUserScreen(),
      },
      initialRoute: '/',
    );
  }
}
