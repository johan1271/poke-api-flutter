import 'dart:convert';

class PokemonList{
  
  List<Pokemon> items = [];

  PokemonList();

  PokemonList.fromJsonList(jsonList){
    if(jsonList== null) return;
    for( var item in jsonList){
        final pokemon = Pokemon.fromJsonMap(item);
        items.add(pokemon);
    }
  }
}


class Pokemon{
  late String name;
  late String image;
  late List types;

  Pokemon(this.name, this.image, this.types);

  Pokemon.fromJsonMap(Map<String, dynamic> json){
    //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png
    name = json["name"];
    image = json['sprites']['other']['home']['front_default'];
    types = json['types'];

    
  }


  
}