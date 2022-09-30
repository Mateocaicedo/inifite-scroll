import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Model_Gifs.dart';



List<Widget> listGifs(List<ModelGifs> data){
  List<Widget> gifs = [];
  for(var gif in data){
    gifs.add(
      Card(
        child: Column(
          children: [
            Expanded(child: Image.network(gif.url, fit: BoxFit.fill,))
          ],
        ),
      )
    );
  }
  return gifs;
}
