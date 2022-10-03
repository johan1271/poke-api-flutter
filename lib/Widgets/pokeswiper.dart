import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:api_giphy/Models/pokemon_model.dart';
import "package:api_giphy/Widgets/color.dart";

import 'package:api_giphy/Provider/poke_provider.dart';

class PokeSwiper extends StatefulWidget {
  const PokeSwiper({Key? key}) : super(key: key);

  @override
  State<PokeSwiper> createState() => _PokeSwiperState();
}

class _PokeSwiperState extends State<PokeSwiper> {
  int page = 0;
  late Future<List<Pokemon>> _listPokemon;

  @override
  void initState() {
    super.initState();
    _listPokemon = PokemonProvider().getPokemonList(page);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _listPokemon,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return LayoutBuilder(
            builder: ((context, constraints) {
              return Swiper(
                // controller: controller,

                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return stack(snapshot.data![index]);
                },
                itemWidth: constraints.maxWidth * 1.7,
                layout: SwiperLayout.STACK,
                onIndexChanged: ((value) {
                  if (value == snapshot.data!.length - 7) {
                    final getprovider = PokemonProvider();
                    page += 10;
                    getprovider.getPokemonList(page).then((value) {
                      setState(() {
                        _listPokemon.then((pokemons) => pokemons.addAll(value));
                      });
                    });
                  }
                }),
                loop: false,
              );
            }),
          );
        });
  }

  Widget stack(Pokemon pokemon) {
    var pokeType = pokemon.types[0]['type']['name'];
    

    return Stack(
      children: [
        Center(
          child: Container(
            width: 350,
            height: 450,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: getColor(pokeType).withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(-4, 2),
                  ),
                ],
                color: getColor(pokeType),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Center(
          child: Image.network(
            pokemon.image,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            top: 80,
            left: 50,
            child: SizedBox(
              width: 250,
              height: 40,
              child: Text(pokemon.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            )),
        Positioned(
            top: 120,
            left: 50,
            child: Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("$pokeType",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 245, 239, 239))),
            )),
      ],
    );
  }

  
}
