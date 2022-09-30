import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Home_page.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Aplicacion de Gifs',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => MyHomeApp(
           title: 'Aplicación de Gifs'
       )
     },
   );
  }
}