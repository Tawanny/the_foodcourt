import 'package:flutter/material.dart';

import '../models/theme_colors.dart';

import '../screens/details_screen.dart';

class TabMeal extends StatelessWidget {
  final String id;
  final String title;
  //final List<String> description;
  final String imageUrl;
  final int duration;
  final double price;
  final bool isFav;

  TabMeal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    //@required this.description,
    @required this.price,
    @required this.duration,
    @required this.isFav,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 220,
        height: 300,
        decoration: BoxDecoration(
          color: grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => selectMeal(context),
              child: Container(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: green,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'description',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'R$price',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
