import 'dart:convert';
import 'package:flutter_application_1/Models/Model_Gifs.dart';
import 'package:http/http.dart' as http;



class  GifProvider{
  

  Future<List<ModelGifs>> getGifs(int page) async{
    final url = "https://api.giphy.com/v1/gifs/trending?api_key=081Z33Gf8OaNbdK1upYCzUqPGG90MimV&limit=10&rating=g&offset=${page}";
      final resp = await http.get(Uri.parse(url));
      if(resp.statusCode == 200){
        String body = utf8.decode(resp.bodyBytes);
        final jsonData = jsonDecode(body);
        final gifs = Gifs.fromJsonList(jsonData);
        return gifs.items;
      }else{
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
  }
}