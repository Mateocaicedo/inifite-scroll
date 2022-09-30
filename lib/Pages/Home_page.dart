import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Model_Gifs.dart';
import 'package:flutter_application_1/Provider/Gif_Provider.dart';
import 'package:flutter_application_1/Widgets/listGifs.dart';


class MyHomeApp extends StatefulWidget{
  const MyHomeApp({Key? key, required this.title}): super(key: key);

  final String title;
  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp>{

  late Future<List<ModelGifs>> _listadoGifs;
  late ScrollController _controller;
  final getprovider = GifProvider();
  int page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {

      //
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        

          page += 10;
          
          getprovider.getGifs(page).then((value) {
            setState(() {
              _listadoGifs.then((listGifs) => listGifs.addAll(value));
            });
          });

      
      }


    });
    
    _listadoGifs = getprovider.getGifs(page);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if(snapshot.hasData){
              return GridView.count(
                  crossAxisCount: 2,
                  controller: _controller,
                children: listGifs(snapshot.data as List<ModelGifs>),
              );
          }else{
              print(snapshot.error);
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

}