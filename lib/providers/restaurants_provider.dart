import 'package:flutter/material.dart';

import '../models/helper.dart';

class Restaurant {
  final String id;
  final String name;
  final String logo;
  final List<String> popularFoods;
  final String type;
  final String imageUrl;
  final String prepTime;
  final double rating;
  final int reviews;
  final Color color;

  const Restaurant({
    @required this.id,
    @required this.name, //16 characters
    @required this.logo,
    @required this.popularFoods,
    @required this.type,
    @required this.rating,
    @required this.reviews,
    @required this.imageUrl,
    @required this.prepTime,
    @required this.color,
  });
}

class RestaurantsProvider with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      id: 'rest1',
      name: 'Zest Restaurant ',
      rating: 4.5,
      reviews: 100,
      prepTime: '20-30 min',
      logo: Helper.getAssetName('zestlogo.png'),
      popularFoods: [
        'BreakFast',
        'Pizzas',
        'Steaks',
      ],
      type: 'Fine Dine',
      imageUrl: Helper.getAssetName('backgroundimage.jpg'),
      color: Colors.black,
    ),
    Restaurant(
      id: 'rest2',
      name: 'RedOx SteakHouse',
      rating: 4,
      reviews: 89,
      prepTime: '20-30',
      logo: Helper.getAssetName('redoxLogo.jpg'),
      popularFoods: [
        'Steaks',
        'Pizzas',
        'Salads'
      ],
      type: 'Steak House',
      imageUrl: Helper.getAssetName('redoxImage.jpg'),
      color: Colors.red[900],
    ),
    Restaurant(
      id: 'rest3',
      name: 'Roman\'s Pizza   ',
      rating: 3.6,
      reviews: 58,
      prepTime: '20-25 min',
      logo: Helper.getAssetName('romanspizzaLogo.jpg'),
      popularFoods: [
        'Pizzas',
        'Pastas',
        'Gatsby'
      ],
      type: 'Pizza',
      imageUrl: Helper.getAssetName('romansImage.jpg'),
      color: Colors.blue[600],
    ),
    Restaurant(
      id: 'rest4',
      name: 'Spur Steak Ranch',
      rating: 4,
      reviews: 89,
      prepTime: '20-25 min',
      logo: Helper.getAssetName('spurLogo.jpg'),
      popularFoods: [
        'Burgers',
        'Steaks',
        'SpurRibs'
      ],
      type: 'Steak Ranch',
      imageUrl: Helper.getAssetName('spurImage.png'),
      color: Colors.blue[600],
    ),
    Restaurant(
      id: 'rest5',
      name: 'Bilo Bistro     ',
      rating: 2.5,
      reviews: 95,
      prepTime: '20-25 min',
      logo: Helper.getAssetName('biloLogo.jpg'),
      popularFoods: [
        'Pizzas',
        'salads',
        'Pastas',
      ],
      type: 'Bistro',
      imageUrl: Helper.getAssetName('biloImage.jpg'),
      color: Colors.blue[600],
    ),
  ];

  List<Restaurant> get getRestaurants {
    return _restaurants;
  }

  Restaurant findById(String id) {
    return _restaurants.firstWhere((restaurant) => restaurant.id == id);
  }
}
