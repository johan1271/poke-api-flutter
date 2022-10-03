import 'package:flutter/material.dart';

Color getColor(String type) {
    
    
    

    

    switch (type) {
      case 'grass':
        return Colors.greenAccent;
      case 'fire':
        return Colors.redAccent;
      case 'water':
        return Colors.blue;
      case 'bug':
        return Colors.lightGreenAccent;
      case 'normal':
        return Colors.black;
      case 'poison':
        return Colors.deepPurpleAccent;
      case 'electric':
        return Colors.yellow;
      case 'ground':
        return  const Color.fromRGBO(224, 192, 104, 1);
      case 'fairy':
        return  const Color.fromRGBO(238, 153, 172, 1);
      case 'fighting':
        return const Color.fromRGBO(192, 48, 40, 1);
      case 'psychic':
        return const Color.fromRGBO(248, 88, 136, 1);
      case 'rock':
        return const Color.fromARGB(255, 148, 144, 126);
      case 'ghost':
        return const Color.fromRGBO(112, 88, 152, 1);
      case 'ice':
        return const Color.fromRGBO(152, 216, 216, 1);
      case 'dragon':
        return const Color.fromRGBO(112, 56, 248, 1);
      case 'dark':
        return const Color.fromRGBO(112, 88, 72, 1);
      case 'steel':
        return const Color.fromRGBO(184, 184, 208, 1);
      default:
        return Colors.pink;
    }
  }