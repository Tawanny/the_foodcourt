import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/meal_item.dart';
import '../widgets/background_image.dart';
import '../widgets/badge.dart';
import '../models/meal.dart';
import './basket_screen.dart';

enum FilterOption {
  Favorites,
  All,
}

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  var _showFavOnly = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealsData = Provider.of<MealsProvider>(context);
    //final categoryMeals = mealsData.getMeals;

    return Stack(
      children: [
        BackgroundImage('https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(categoryTitle),
            actions: <Widget>[
              PopupMenuButton(
                onSelected: (FilterOption selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOption.Favorites) {
                      _showFavOnly = true;
                    } else {
                      _showFavOnly = false;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text(
                      'Only Favorites',
                    ),
                    value: FilterOption.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Show All',
                    ),
                    value: FilterOption.All,
                  ),
                ],
              ),
              Consumer<CartProvider>(
                builder: (context, cart, ch) => Badge(
                  child: ch,
                  value: cart.getItemCount.toString(),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () {
                    Navigator.of(context).pushNamed(BasketScreen.routeName);
                  },
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(
                value: displayedMeals[index],
                child: MealItem(),
              );
            },
            itemCount: displayedMeals.length,
          ),
        ),
      ],
    );
  }
}
