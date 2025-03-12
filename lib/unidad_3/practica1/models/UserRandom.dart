class Userrandom {
  final String nombreCompleto;
  final String genero;
  final String foto;
  final String country;
  final String postcode;
  final String email;
  final String phone;

  Userrandom({
    required this.nombreCompleto,
    required this.genero,
    required this.foto,
    required this.country,
    required this.postcode,
    required this.email,
    required this.phone,
  });

  factory Userrandom.fromJson(Map<String, dynamic> data) {
    final result = data['results'][0];
    return Userrandom(
      country: result['location']['country'],
      nombreCompleto:
          "${result['name']['title']} ${result['name']['first']} ${result['name']['last']}",
      genero: result['gender'] == 'male' ? 'Masculino' : 'Femenino',
      foto: result['picture']['large'],
      postcode: result['location']['postcode'],
      email: result['email'],
      phone: result['phone'],
    );
  }
}
