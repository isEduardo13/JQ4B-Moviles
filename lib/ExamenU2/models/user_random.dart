class Userrandom {
  final String nombreCompleto;
  final String genero;
  final String foto;

  Userrandom({
    required this.nombreCompleto,
    required this.genero,
    required this.foto,
  });

  // Ejemplo de constructor que interpreta la estructura devuelta por randomuser.me
  factory Userrandom.fromJson(Map<String, dynamic> data) {
    final result = data['results'][0];
    return Userrandom(
      nombreCompleto:
          "${result['name']['title']} ${result['name']['first']} ${result['name']['last']}",
      genero: result['gender'] == 'male' ? 'Masculino' : 'Femenino',
      foto: result['picture']['large'],
    );
  }
}
