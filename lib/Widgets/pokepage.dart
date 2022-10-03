import 'package:api_giphy/Models/pokemon_model.dart';
import "package:api_giphy/Widgets/color.dart";
import 'package:flutter/material.dart';


import 'package:api_giphy/Provider/poke_provider.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPage();
}

class _PokemonPage extends State<PokemonPage> {
  late PageController _pageController;
  late Future<List<Pokemon>> _listPokemon;
  late Pokemon pokemon;

  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listPokemon = PokemonProvider().getPokemonList(page);
    _pageController = PageController(viewportFraction: 1 / 2, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<Pokemon>>(
        future: _listPokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(

              itemCount: snapshot.data!.length,
              padEnds: false,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return card(snapshot.data![index]);
              },
              
              onPageChanged: ((index) {
                if (index == snapshot.data!.length - 10) {
                  final getprovider = PokemonProvider();
                  page += 10;
                  getprovider.getPokemonList(page).then((value) {
                    setState(() {
                      _listPokemon.then((pokemons) => pokemons.addAll(value));
                    });
                  });
                }
              }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget card(Pokemon pokemon) {
    var pokeType = pokemon.types[0]['type']['name'];
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        // width: 100,
        // height: 100,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: getColor(pokeType),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(-4, 2), // changes position of shadow
            ),
          ],),
    
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Expanded(
              child: Image.network(
                pokemon.image,
                fit: BoxFit.contain,
                // width: 150,
                // height: 150,
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
              width: 140,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(pokemon.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 245, 239, 239))),
            ),
    
            ),
          ],
        ),
      ),
    );
  }

  
}
