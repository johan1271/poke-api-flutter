import 'package:flutter/material.dart';
import 'package:api_giphy/Pages/Home_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Poke API',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => MyHomeApp(
           title: 'Poke API'
       )
     },
   );
  }
}