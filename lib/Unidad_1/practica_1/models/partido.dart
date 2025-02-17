import 'dart:ffi';

class Partido {
  final String visitante;
  final String local;
  final String rojaVisitante;
  final String rojaLocal;
  final String amarillaVisitante;
  final int golesVisitante;
  final int golesLocal;
  final String logo;
  final String logoVisitante;

  Partido(
      {required this.visitante,
      required this.amarillaVisitante,
      required this.golesVisitante,
      required this.local,
      required this.rojaLocal,
      required this.rojaVisitante,
      required this.logo,
      required this.golesLocal,
      required this.logoVisitante});
}
