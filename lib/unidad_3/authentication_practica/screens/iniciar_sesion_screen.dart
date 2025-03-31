import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/authentication_practica/widgets/formTextField.dart';

class IniciarSesionScreen extends StatefulWidget {
  const IniciarSesionScreen({super.key});

  @override
  State<IniciarSesionScreen> createState() => _IniciarSesionScreenState();
}

class _IniciarSesionScreenState extends State<IniciarSesionScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pantalla de Inicio de Sesión',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            FormTextField(
                txtController: emailController,
                icono: Icons.email,
                prop: email,
                inputType: TextInputType.emailAddress),
            FormTextField(
                txtController: passwordController,
                icono: Icons.lock,
                prop: password,
                inputType: TextInputType.visiblePassword),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  email = emailController.text;
                  password = passwordController.text;
                  login();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor completa todos los campos')),
                  );
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final auth = FirebaseAuth.instance;
                auth.createUserWithEmailAndPassword(
                    email: email, password: password);
              },
              child: const Text('Registrar Usuario'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> login() async {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password);
    if (auth.currentUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inicio de sesión exitoso')),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al iniciar sesión')),
      );
      return false;
    }
  }
}
