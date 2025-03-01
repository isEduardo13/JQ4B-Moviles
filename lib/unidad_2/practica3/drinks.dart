import 'package:holaflutter/unidad_2/practica3/cocktail.dart';

class Drinks {
  final List<Cocktail> drinks;

  Drinks({required this.drinks});

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      drinks: (json['drinks'] as List<dynamic>)
          .map((item) => Cocktail.fromJson(item))
          .toList(),
    );
  }
}
