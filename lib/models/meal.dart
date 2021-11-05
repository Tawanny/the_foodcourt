import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> description;
  final int duration;
  bool isFavorite;
  final double price;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.duration,
    this.isFavorite = false,
    @required this.price,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  List<Meal> _favoriteMeals = [];

  List<Meal> get getFavoriteMeals {
    return _favoriteMeals;
  }

  void addToFavorites(Meal meal) {
    if (meal.isFavorite) {
      _favoriteMeals.remove(meal);
    }
    if (!meal.isFavorite) {
      _favoriteMeals.add(meal);
    }
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  bool getFavoriteStatus() {
    isFavorite;
    notifyListeners();
  }

  void toggleFavorites(String mealId, List<Meal> availableMeals) {
    final existingIndex = _favoriteMeals.indexWhere((meal) {
      meal.id == mealId;
      print('meal.id = ' + meal.id);
      print('mealId = ' + mealId);
    });
    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(
        availableMeals.firstWhere((meal) => meal.id == mealId),
      );
    }
    notifyListeners();
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }
}
