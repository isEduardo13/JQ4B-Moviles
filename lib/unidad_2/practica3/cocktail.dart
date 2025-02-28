class Cocktail {
  String idDrink;
  String strDrink;
  String strDrinkThumb;

  Cocktail(
      {required this.idDrink,
      required this.strDrinkThumb,
      required this.strDrink});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
        idDrink: json['idDrink'],
        strDrinkThumb: json['strDrinkThumb'],
        strDrink: json['strDrink']);
  }
}
