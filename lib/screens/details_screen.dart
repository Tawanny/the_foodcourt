import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

import '../models/meal.dart';
import '../providers/meals_provider.dart';
import '../providers/cart_provider.dart';
import '../models/theme_colors.dart';
import '../widgets/meal_details_widget.dart';
import './basket_screen.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  // Function toggleFavorite;
  // Function isFavorite;

  // DetailsScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final mealP = Provider.of<Meal>(context);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealsData = Provider.of<MealsProvider>(context);
    final mealsList = mealsData.getMeals;
    final cart = Provider.of<CartProvider>(context);
    final selectedMeal = mealsData.findById(mealId);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.message_outlined),
                    ),
                  ],
                ),

                Hero(
                  tag: selectedMeal.id,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.network(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                //Color(0xff141921)
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlurryContainer(
                    height: 800,
                    bgColor: black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: Text(
                            selectedMeal.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: black,
                            ),
                          ),
                        ),
                        MealDetailsWidget(
                          numOfReviews: 24,
                          rating: 4,
                          price: selectedMeal.price,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  typeCheck('Vegan', selectedMeal.isVegan),
                                  typeCheck('Vegitarian', selectedMeal.isVegetarian),
                                  typeCheck('Gluten Free', selectedMeal.isGlutenFree),
                                  typeCheck('Lactose Free', selectedMeal.isLactoseFree),
                                ],
                              ),
                              Builder(builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: FlatButton.icon(
                                    color: amber,
                                    onPressed: () {
                                      cart.addItem(selectedMeal.id, selectedMeal.title, selectedMeal.price);
                                      Scaffold.of(context).hideCurrentSnackBar();
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: green,
                                          content: Text(
                                            'You have added an Item to Basket.',
                                            style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          duration: Duration(seconds: 2),
                                          action: SnackBarAction(
                                            label: 'UNDO',
                                            textColor: amber,
                                            onPressed: () {
                                              cart.removeSingleItem(selectedMeal.id);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.shopping_basket),
                                    label: Text(
                                      'Order',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }),

                              // Consumer<MealsProvider>(
                              //   builder: (ctx, meal, child) => IconButton(
                              //     icon: Icon(meal.getFavoriteStatus(id) ? Icons.favorite : Icons.favorite_border),
                              //     color: Theme.of(context).accentColor,
                              //     onPressed: () {
                              //       meal.toggleFavoriteStatus(id);
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.schedule,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Preparation time: ',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('${selectedMeal.duration} min'),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Add meal to favorites: ',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () => mealP.toggleFavorites(mealId, mealsList),
                                icon: Icon(mealP.isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${selectedMeal.description}',
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(BasketScreen.routeName);
        },
        label: Text(
          'Go To Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget typeCheck(String title, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        value ? Icon(Icons.done_all, color: green) : Icon(Icons.close, color: Colors.red),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
