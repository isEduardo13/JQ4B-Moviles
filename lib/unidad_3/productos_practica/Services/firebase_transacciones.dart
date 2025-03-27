import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holaflutter/unidad_3/productos_practica/Models/product.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference collection = firestore.collection('Productos');

Future<List<Product>> getProducts() async {
  QuerySnapshot queryProductos = await collection.get();
  return queryProductos.docs.map((e) =>
      //Producto.getFirebase(e.data() as Map<String, dynamic>);
      Product.getFirebaseId(e.id, e.data() as Map<String, dynamic>)).toList();
}

Future<int> addProduct(Product p) async {
  int code = 0;
  try {
    await collection.add(p.toJson());
    code = 200;
  } catch (e) {
    code = 500;
  }
  return code;
}

Future<int> updateProducto(Product p) async {
  int code = 0;
  try {
    await collection.doc(p.id).set(p.toJson());
    code = 200;
  } catch (e) {
    code = 500;
  }
  return code;
}

Future<int> deleteProducto(String id) async {
  int code = 0;
  try {
    await collection.doc(id).delete();
    code = 200;
  } catch (e) {
    code = 500;
  }
  return code;
}
