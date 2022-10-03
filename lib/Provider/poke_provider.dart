import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:api_giphy/Models/pokemon_model.dart';

class PokemonProvider {
  final url = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=";

  

  Future<List<Pokemon>> getPokemonList(int page) async {

    final resp = await http.get(Uri.parse('$url$page'));
    final List pokemonList = [];
    
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);

      // jsonData['results'].forEach((element) {
      //   var item = getPokemon(element['url']);
      //   pokemonList.add(item);
      //  });

      for (var pokemon in jsonData['results']) {
         var item = await getPokemon(pokemon['url']);
         pokemonList.add(item);
      }
      

      final pokemons = PokemonList.fromJsonList(pokemonList);

      

      return pokemons.items;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future getPokemon(String url) async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);

      return jsonData;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }
}
