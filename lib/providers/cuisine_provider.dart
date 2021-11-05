import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/helper.dart';

class Cuisine {
  final String id;
  final String title;
  final String imageUrl;

  Cuisine({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });
}

class CuisineProvider with ChangeNotifier {
  List<Cuisine> _cuisines = [
    Cuisine(
      id: 'cu1',
      title: 'Asian',
      imageUrl: asianImageUrl,
    ),
    Cuisine(
      id: 'cu2',
      title: 'African',
      imageUrl: africanImageUrl,
    ),
    Cuisine(
      id: 'cu3',
      title: 'Italian',
      imageUrl: italianImageUrl,
    ),
    Cuisine(
      id: 'cu4',
      title: 'Pizza',
      imageUrl: pizzaImageUrl,
    ),
    Cuisine(
      id: 'cu5',
      title: 'Indian',
      imageUrl: indianImageUrl,
    ),
    Cuisine(
      id: 'cu6',
      title: 'Platters',
      imageUrl: plattersImageUrl,
    ),
    Cuisine(
      id: 'cu7',
      title: 'Mexican',
      imageUrl: mexicanImageUrl,
    ),
    Cuisine(
      id: 'cu8',
      title: 'Sushi',
      imageUrl: sushiImageUrl,
    ),
    Cuisine(
      id: 'cu9',
      title: 'American',
      imageUrl: fastFoodImageUrl,
    ),
    Cuisine(
      id: 'cu10',
      title: 'Thai',
      imageUrl: thaiImageUrl,
    ),
  ];

  List<Cuisine> get getCuisines {
    return _cuisines;
  }
}
