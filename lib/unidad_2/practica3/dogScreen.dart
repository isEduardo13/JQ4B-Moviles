import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holaflutter/unidad_2/practica3/cocktail.dart';
import 'package:holaflutter/unidad_2/practica3/dog.dart';
import 'package:holaflutter/unidad_2/practica3/drinks.dart';
import 'package:http/http.dart' as http;

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  Future<Dog> getDog() async {
    var URL = Uri.https("dog.ceo", "api/breeds/image/random");
    final response = await http.get(URL);

    if (response.statusCode == 200) {
      return Dog.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<Drinks> getCocktail() async {
    var URL = Uri.https(
        "www.thecocktaildb.com", "api/json/v1/1/lookup.php", {"i": "11007"});
    final response = await http.get(URL);

    if (response.statusCode == 200) {
      return Drinks.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getCocktail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network(
                        snapshot.data?.drinks.first.strDrinkThumb ?? ""),
                  ),
                  Text(
                      snapshot.data?.drinks.first.strDrink ?? "Sin resultados"),
                ],
              ),
              //Text(snapshot.data?.status ?? "Sin resultados"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
