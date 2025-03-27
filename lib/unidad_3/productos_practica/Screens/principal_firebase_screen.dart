import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_3/productos_practica/widgets/list_tile_product.dart';

class PrincipalFirebaseScreen extends StatefulWidget {
  const PrincipalFirebaseScreen({super.key});

  @override
  State<PrincipalFirebaseScreen> createState() =>
      _PrincipalFirebaseScreenState();
}

class _PrincipalFirebaseScreenState extends State<PrincipalFirebaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/formularioProducto');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Base de datos Firebase'),
        centerTitle: true,
        actions: [],
      ),
      body: Center(
        child: ListTileProduct(),
      ),
    );
  }
}
