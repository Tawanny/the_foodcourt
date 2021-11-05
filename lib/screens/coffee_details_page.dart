import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../providers/cart_provider.dart';
import '../models/theme_colors.dart';
import './basket_screen.dart';
import '../models/helper.dart';

class CoffeeDetailsPage extends StatelessWidget {
  static const routeName = '/coffee_details';

  const CoffeeDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealsData = Provider.of<MealsProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    final mealsList = mealsData.getMeals;
    final selectedMeal = mealsData.findById(mealId);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: AssetImage(
                                selectedMeal.imageUrl,
                              ),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      top: 320,
                      child: BlurryContainer(
                        padding: EdgeInsets.all(20),
                        height: 130,
                        bgColor: Color(0xff141921),
                        width: 377,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedMeal.title,
                                  style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Helper.getAssetName(
                                        'coffee-beans.svg',
                                      ),
                                      height: 20,
                                      color: green,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Deluxe Blend",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Helper.getAssetName(
                                        'star.svg',
                                      ),
                                      height: 20,
                                      color: Color(0xffd17842),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "(6.983)",
                                      style: TextStyle(color: Color(0xff919296)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'R${selectedMeal.price}',
                                  style: TextStyle(color: white, fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                ButtonTheme(
                                  minWidth: 130,
                                  height: 30,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    onPressed: () {
                                      cart.addItem(selectedMeal.id, selectedMeal.title, selectedMeal.price);
                                      // Scaffold.of(context).hideCurrentSnackBar();
                                      // Scaffold.of(context).showSnackBar(
                                      //   SnackBar(
                                      //     backgroundColor: green,
                                      //     content: Text('You have added an Item to Basket.'),
                                      //     duration: Duration(seconds: 2),
                                      //     action: SnackBarAction(
                                      //       label: 'UNDO',
                                      //       onPressed: () {
                                      //         cart.removeSingleItem(selectedMeal.id);
                                      //       },
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    color: amber,
                                    child: Text(
                                      'Order Now',
                                      style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(color: black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${selectedMeal.description}',
                        style: TextStyle(color: black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            colors: [
                              white,
                              Colors.brown,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                tailoredCheckBox(title: 'Regular'),
                                tailoredCheckBox(title: 'Large'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Choose Your Milk",
                                  style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                tailoredCheckBox(title: 'Full Cream'),
                                tailoredCheckBox(title: 'Skinny Milk'),
                                tailoredCheckBox(title: 'Almond Milk'),
                                tailoredCheckBox(title: 'Oat Milk'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                    ],
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

  Widget tailoredCheckBox({String title}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: green,
          onChanged: null,
          value: false,
        ),
        Text(
          title,
          style: TextStyle(
            color: black,
          ),
        ),
      ],
    );
  }
}
