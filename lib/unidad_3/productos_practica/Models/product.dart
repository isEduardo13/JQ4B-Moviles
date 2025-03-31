class Product {
  String? id;
  String nombre;
  double precio;
  int stock;
  String? imagenUrl;

  Product(
      {this.id,
      required this.nombre,
      required this.precio,
      required this.stock,
      this.imagenUrl});

  factory Product.getFirebase(Map json) {
    return Product(
        id: json['id'],
        nombre: json['nombre'],
        precio: double.parse(json['precio'].toString()),
        stock: json['stock'],
        imagenUrl: json['imagenUrl']);
  }

  factory Product.getFirebaseId(String idd, Map json) {
    return Product(
        id: idd,
        nombre: json['nombre'],
        precio: double.parse(json['precio'].toString()),
        stock: json['stock'],
        imagenUrl: json['imagenUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'precio': precio,
      'stock': stock,
      'imagenUrl': imagenUrl
    };
  }
}
