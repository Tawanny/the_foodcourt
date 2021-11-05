import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blurrycontainer/blurrycontainer.dart';

import '../models/theme_colors.dart';
import '../models/meal.dart';
import '../providers/cart_provider.dart';
import '../providers/meals_provider.dart';

import '../screens/coffee_details_page.dart';
import '../screens/details_screen.dart';

class MealItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final int duration;
  // final double price;
  // // final String category;

  // MealItem({
  //   @required this.id,
  //   @required this.title,
  //   @required this.imageUrl,
  //   @required this.price,
  //   @required this.duration,
  //   // @required this.category,
  // });

  void selectMeal(BuildContext context) {
    final mealP = Provider.of<Meal>(context);
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: mealP.id,
    );
  }

  void selectCoffee(BuildContext context) {
    final mealP = Provider.of<Meal>(context);
    Navigator.of(context).pushNamed(
      CoffeeDetailsPage.routeName,
      arguments: mealP.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealP = Provider.of<Meal>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);
    final mealsData = Provider.of<MealsProvider>(context, listen: false);
    final meal = mealsData.findById(mealP.id);

    return InkWell(
      onTap: () {
        if (meal.categories.contains('c8')) {
          selectCoffee(context);
        } else {
          selectMeal(context);
        }
        ;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          elevation: 20,
          color: Colors.transparent,
          child: BlurryContainer(
            height: 160,
            bgColor: white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: 125,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Hero(
                      tag: mealP.id,
                      child: meal.categories.contains('c8')
                          ? Image.asset(meal.imageUrl)
                          : Image.network(
                              mealP.imageUrl,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      width: 125,
                      height: 50,
                      child: Text(
                        mealP.title,
                        style: TextStyle(
                          color: green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.schedule_outlined),
                        Text('${mealP.duration} min'),
                        SizedBox(width: 10),
                        Text(
                          'R${mealP.price}',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Builder(builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: FlatButton.icon(
                          color: amber,
                          onPressed: () {
                            cart.addItem(mealP.id, mealP.title, mealP.price);
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
                                    cart.removeSingleItem(mealP.id);
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
                  ],
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(mealP.isFavorite ? Icons.favorite : Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    mealP.toggleFavoriteStatus();
                    mealP.addToFavorites(meal);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //   InkWell(
    //     onTap: () {
    //       if (meal.categories.contains('c8')) {
    //         selectCoffee(context);
    //       } else {
    //         selectMeal(context);
    //       }
    //       ;
    //     },
    //     child: Container(
    //       height: 320,
    //       width: 150,
    //       child: Card(
    //         // width: 100,
    //         color: black,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         elevation: 4,
    //         margin: EdgeInsets.all(10),
    //         child: Column(
    //           children: <Widget>[
    //             Stack(
    //               children: <Widget>[
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(15),
    //                     topRight: Radius.circular(15),
    //                   ),
    //                   child: Hero(
    //                     tag: id,
    //                     child: meal.categories.contains('c8')
    //                         ? Image.asset(imageUrl)
    //                         : Image.network(
    //                             imageUrl,
    //                             height: 250,
    //                             width: double.infinity,
    //                             fit: BoxFit.cover,
    //                           ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   top: 10,
    //                   right: 5,
    //                   child: Stack(
    //                     overflow: Overflow.visible,
    //                     children: [
    //                       Container(
    //                         width: 30,
    //                         height: 160,
    //                         alignment: Alignment.topCenter,
    //                         decoration: BoxDecoration(
    //                           color: Colors.black54,
    //                           borderRadius: BorderRadius.all(
    //                             Radius.circular(10),
    //                           ),
    //                         ),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                           crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             InkWell(
    //                               onTap: null,
    //                               child: Icon(
    //                                 Icons.attach_money_outlined,
    //                                 color: amber,
    //                                 size: 30,
    //                               ),
    //                             ),
    //                             InkWell(
    //                               onTap: null,
    //                               child: Icon(
    //                                 Icons.schedule_outlined,
    //                                 color: amber,
    //                                 size: 20,
    //                               ),
    //                             ),
    //                             InkWell(
    //                               onTap: null,
    //                               child: Icon(
    //                                 Icons.favorite_border_outlined,
    //                                 color: amber,
    //                                 size: 20,
    //                               ),
    //                             ),
    //                             InkWell(
    //                               onTap: null,
    //                               onDoubleTap: () {
    //                                 cart.addItem(id, title, price);
    //                                 Scaffold.of(context).hideCurrentSnackBar();
    //                                 Scaffold.of(context).showSnackBar(
    //                                   SnackBar(
    //                                     backgroundColor: green,
    //                                     content: Text('You have added an Item to Basket.'),
    //                                     duration: Duration(seconds: 2),
    //                                     action: SnackBarAction(
    //                                       label: 'UNDO',
    //                                       textColor: black,
    //                                       onPressed: () {
    //                                         cart.removeSingleItem(id);
    //                                       },
    //                                     ),
    //                                   ),
    //                                 );
    //                               },
    //                               child: Icon(
    //                                 Icons.shopping_basket_outlined,
    //                                 color: amber,
    //                                 size: 20,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       // Positioned(
    //                       //   top: 0,
    //                       //   left: -100,
    //                       //   child: Container(
    //                       //     width: 100,
    //                       //     height: 30,
    //                       //     alignment: Alignment.center,
    //                       //     decoration: BoxDecoration(
    //                       //       color: Colors.black54,
    //                       //       borderRadius: BorderRadius.all(
    //                       //         Radius.circular(10),
    //                       //       ),
    //                       //     ),
    //                       //     child: Text(
    //                       //       'Message',
    //                       //       style: TextStyle(
    //                       //         color: white,
    //                       //       ),
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: 5),
    //             Text(
    //               title,
    //               style: TextStyle(
    //                 color: green,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }

// Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           icon(icon: Icons.schedule_outlined, title: '$duration min'),
//                           Row(
//                             children: <Widget>[
//                               Icon(
//                                 Icons.attach_money,
//                               ),
//                               SizedBox(
//                                 width: 6,
//                               ),
//                               Text('R$price'),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               IconButton(
//                                 icon: Icon(Icons.shopping_basket),
//                                 onPressed: () {
//                                   cart.addItem(id, title, price);
//                                   Scaffold.of(context).hideCurrentSnackBar();
//                                   Scaffold.of(context).showSnackBar(
//                                     SnackBar(
//                                       backgroundColor: green,
//                                       content: Text('You have added an Item to Basket.'),
//                                       duration: Duration(seconds: 2),
//                                       action: SnackBarAction(
//                                         label: 'UNDO',
//                                         onPressed: () {
//                                           cart.removeSingleItem(id);
//                                         },
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 6,
//                               ),
//                               Text('Order'),
//                             ],
//                           ),
//                           Consumer<MealsProvider>(
//                             builder: (ctx, meal, child) => IconButton(
//                               icon: Icon(meal.getFavoriteStatus(id) ? Icons.favorite : Icons.favorite_border),
//                               color: Theme.of(context).accentColor,
//                               onPressed: () {
//                                 meal.toggleFavoriteStatus(id);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
}
