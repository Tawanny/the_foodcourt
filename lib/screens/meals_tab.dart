import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme_colors.dart';
import '../providers/restaurants_provider.dart';
import '../providers/meals_provider.dart';
import '../providers/speciality_provider.dart';
import '../providers/cuisine_provider.dart';
import '../widgets/tab_meal.dart';
import '../widgets/speciality_card.dart';
import '../widgets/restaurant_item.dart';
import '../widgets/cuisine_item.dart';
import '../screens/favorites_screen.dart';

class MealsTab extends StatelessWidget {
  static const routeName = '/meals_tab';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 185,
      decoration: BoxDecoration(
        color: white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Text(
                  'What Would you like to have Today?',
                  style: TextStyle(
                    color: black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: 'Search Meal or restaurant',
                ),
              ),
            ),
            headingWidget(
              heading: 'Explore by Cuisines:',
              routeName: FavoritesScreen.routeName,
              actionText: 'Explore All',
            ),
            cuisineList(context),
            SizedBox(height: 20),
            headingWidget(heading: 'Available Restaurants:', routeName: FavoritesScreen.routeName, actionText: 'View All'),
            restaurantList(context),
            headingWidget(heading: 'Events:', routeName: FavoritesScreen.routeName, actionText: 'View All'),
            specialityMeal(context),
            headingWidget(heading: 'Your Favorites:', routeName: FavoritesScreen.routeName, actionText: 'View All'),
            tailoredMealItem(context),
            headingWidget(heading: 'Specials:', routeName: FavoritesScreen.routeName, actionText: 'View All'),
            tailoredMealItem(context),
          ],
        ),
      ),
    );
  }

  Widget headingWidget({
    BuildContext ctx,
    String heading,
    String routeName,
    String actionText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 20, top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: green),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pushNamed(routeName),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.amber, width: 1),
                ),
              ),
              child: Text(
                actionText,
                style: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tailoredMealItem(BuildContext context) {
    final mealsList = Provider.of<MealsProvider>(context).getMeals;
    final subList = [
      mealsList[0],
      mealsList[1],
      mealsList[2],
      mealsList[3],
      mealsList[4],
      mealsList[5],
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          subList.length,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: TabMeal(
                id: subList[index].id,
                title: subList[index].title,
                imageUrl: subList[index].imageUrl,
                duration: subList[index].duration,
                //description: subList[index].description,
                price: subList[index].price,
                isFav: subList[index].isFavorite,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget specialityMeal(BuildContext context) {
    final mealsList = Provider.of<SpecialityProvider>(context).getItems;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          mealsList.length,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: SpecialityCard(
                id: mealsList[index].id,
                title: mealsList[index].title,
                imageUrl: mealsList[index].imageUrl,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget restaurantList(BuildContext context) {
    final restList = Provider.of<RestaurantsProvider>(context).getRestaurants;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          restList.length,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: RestaurantItem(
                id: restList[index].id,
                name: restList[index].name,
                type: restList[index].type,
                prepTime: restList[index].prepTime,
                imageUrl: restList[index].imageUrl,
                color: restList[index].color,
                rating: restList[index].rating,
                reviews: restList[index].reviews,
                logo: restList[index].logo,
                popularFoods: restList[index].popularFoods,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget cuisineList(BuildContext context) {
    final cuisines = Provider.of<CuisineProvider>(context).getCuisines;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cuisines.length,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: CuisineItem(
                id: cuisines[index].id,
                title: cuisines[index].title,
                imageUrl: cuisines[index].imageUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
