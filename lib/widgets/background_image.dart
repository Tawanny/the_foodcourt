import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  // const BackgroundImage ({
  //   Key key,
  // }) : super(key: key);

  final String imageUrl; 

  BackgroundImage(this.imageUrl);

  
  @override
  Widget build (BuildContext context) {
    return
       Container(
        decoration: BoxDecoration(
          image: DecorationImage(
           image: NetworkImage(imageUrl),
         fit: BoxFit.cover,
          ),
        ),
     
    );
  }
}