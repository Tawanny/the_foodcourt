import 'package:flutter/material.dart';

import '../models/helper.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final List<String> restId;
  final String imageUrl;

  const Category({
    @required this.id,
    @required this.title,
    @required this.restId,
    @required this.imageUrl,
    this.color = Colors.orange,
  });
}

class CategoriesProvider with ChangeNotifier {
  final List<Category> _categories = [
    Category(
      id: 'c1',
      title: 'Tapas',
      color: Colors.purple,
      imageUrl: Helper.getAssetName('camembertStarter.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c2',
      title: 'Starters',
      color: Colors.red,
      imageUrl: Helper.getAssetName('camembertStarter.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c3',
      title: 'Burgers',
      color: Colors.orange,
      imageUrl: Helper.getAssetName('chickenBurger.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c4',
      title: 'Salads',
      color: Colors.amber,
      imageUrl: Helper.getAssetName('smokedSalmonSalad.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c5',
      title: 'Pastas',
      color: Colors.blue,
      imageUrl: Helper.getAssetName('camembertStarter.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c6',
      title: 'Steaks',
      color: Colors.green,
      imageUrl: Helper.getAssetName('sirloinJerepigo.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c7',
      title: 'Hearty Meals',
      color: Colors.lightBlue,
      imageUrl: Helper.getAssetName('hakeThermidor.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c8',
      title: 'Coffees',
      color: Colors.lightGreen,
      imageUrl: Helper.getAssetName('cortado.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c9',
      title: 'Breakfast',
      color: Colors.pink,
      imageUrl: Helper.getAssetName('lattee.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
    Category(
      id: 'c10',
      title: 'Deserts',
      color: Colors.teal,
      imageUrl: Helper.getAssetName('lemon.jpg'),
      restId: [
        'rest1',
        'rest2',
        'rest3',
        'rest4',
        'rest5',
      ],
    ),
  ];

  List<Category> get getCategories {
    return _categories;
  }

  Category findById(String id) {
    return _categories.firstWhere((category) => category.id == id);
  }
}
