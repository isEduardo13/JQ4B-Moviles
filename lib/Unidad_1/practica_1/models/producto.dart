class Producto {
  final String nombre;
  final String imagen;
  final double precio;
  final int stock;
  final double precioOferta;
  final bool oferta;

  Producto(
      {required this.nombre,
      required this.stock,
      required this.precioOferta,
      required this.precio,
      required this.oferta,
      required this.imagen});
}
