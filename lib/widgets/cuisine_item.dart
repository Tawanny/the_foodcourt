import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../models/theme_colors.dart';

class CuisineItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CuisineItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {},
        child: BlurryContainer(
          padding: EdgeInsets.all(5),
          height: 50,
          bgColor: amber,
          width: 180,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: ListTile(
            hoverColor: amber,
            selectedTileColor: amber,
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(title,
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
          ),
        ),
      ),
    );
  }
}
