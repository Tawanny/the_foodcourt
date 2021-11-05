import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = './Favorites_screen';
  // final List<Meal> favoriteMeals;

  // FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = Provider.of<Meal>(context).getFavoriteMeals;
    return Scaffold(
      appBar: AppBar(
        title: Text('favorites'),
      ),
      body: favoriteMeals.isEmpty
          ? Center(child: Text('Favorites Screen'))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider<Meal>.value(
                  value: favoriteMeals[index],
                  child: MealItem(),
                );
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
