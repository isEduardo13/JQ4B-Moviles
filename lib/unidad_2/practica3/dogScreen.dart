import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica3/cocktail.dart';
import 'package:holaflutter/unidad_2/practica3/dog.dart';
import 'package:http/http.dart' as http;

class DogScreen extends StatelessWidget {
  const DogScreen({Key? key}) : super(key: key);

  Future<Dog> getDog() async {
    var URL = Uri.https("dog.ceo", "api/breeds/image/random");
    final response = await http.get(URL);

    if (response.statusCode == 200) {
      return Dog.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Cocktail> getCocktail() async {
    var URL = Uri.https("www.thecocktaildb.com", "api/json/v1/1/lookup.php?");
    final response = await http.get(URL);

    if (response.statusCode == 200) {
      return Cocktail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Screen'),
      ),
      body: FutureBuilder(
        future: getCocktail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network(snapshot.data?.strDrinkThumb ?? ""),
                  ),
                  Text(snapshot.data?.strDrink ?? "Sin resultados"),
                ],
              ),
              //Text(snapshot.data?.status ?? "Sin resultados"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString() + snapshot.data.toString()),
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
