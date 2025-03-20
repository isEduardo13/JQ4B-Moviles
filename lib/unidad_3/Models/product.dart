class Product {
  String? id;
  String nombre;
  double precio;
  int stock;

  Product(
      {this.id,
      required this.nombre,
      required this.precio,
      required this.stock});

  factory Product.getFirebase(Map json) {
    return Product(
        id: json['id'],
        nombre: json['nombre'],
        precio: double.parse(json['precio'].toString()),
        stock: json['stock']);
  }

  factory Product.getFirebaseId(String idd, Map json) {
    return Product(
        id: idd,
        nombre: json['nombre'],
        precio: double.parse(json['precio'].toString()),
        stock: json['stock']);
  }

  Map<String, dynamic> toJson() {
    return {'nombre': nombre, 'precio': precio, 'stock': stock};
  }
}
