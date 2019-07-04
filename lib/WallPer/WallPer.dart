import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallper/WallPer/fullscreen_image.dart';

class wallscreen extends StatefulWidget {
  @override
  _wallscreenState createState() => _wallscreenState();
}

class _wallscreenState extends State<wallscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallper"),
      ),
      body: new StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: 1000,
                itemBuilder: (context, i) {
                  String imgPath = "http://picsum.photos/500/500?image="+(i+10).toString();
                  return  Material(
                    elevation: 8.0,
                    borderRadius:
                         BorderRadius.all( Radius.circular(8.0)),
                    child:  InkWell(
                       onTap: () {
                          // ..load()
                          // ..show();
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new FullScreenImagePage(imgPath)));
                      },
                      borderRadius:  BorderRadius.all( Radius.circular(8.0)),
                      child:  Hero(
                        tag: imgPath,
                        child:  FadeInImage(
                          image:  NetworkImage(imgPath),
                          fit: BoxFit.cover, 
                          placeholder:  AssetImage("assets/wallfy.png"),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
              
                     StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                
              )
            
    );
  }
}