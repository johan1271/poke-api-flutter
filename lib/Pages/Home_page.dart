import 'package:api_giphy/Widgets/pokeswiper.dart';
import 'package:flutter/material.dart';

import 'package:api_giphy/Models/pokemon_model.dart';
import 'package:api_giphy/Provider/poke_provider.dart';


import 'package:api_giphy/Widgets/pokepage.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp> {

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(flex:1,child: PokemonPage()),
            Expanded(flex:2,child: PokeSwiper())
          ],
        )

        

        );
  }
}
