import 'package:flutter/material.dart';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../models/theme_colors.dart';

import '../screens/categories_screen.dart';

class RestaurantItem extends StatelessWidget {
  final String id;
  final String name;
  final String logo;
  final String prepTime;
  final String type;
  final String imageUrl;
  final Color color;
  final double rating;
  final int reviews;
  final List<String> popularFoods;

  RestaurantItem({
    @required this.id,
    @required this.name,
    @required this.logo,
    @required this.prepTime,
    @required this.type,
    @required this.rating,
    @required this.reviews,
    @required this.imageUrl,
    @required this.color,
    @required this.popularFoods,
  });
  void selectRestaurant(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoriesScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<CartProvider>(context, listen: false);
    // final restData = Provider.of<RestaurantsProvider>(context, listen: false);
    // final restaurant = restData.findById(id);

    return InkWell(
      onTap: () => selectRestaurant(context),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imageUrl,
                        height: 280,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlurryContainer(
                          width: 110,
                          height: 40,
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          bgColor: Color(0xff141921),
                          child: Row(
                            children: [
                              Text('$rating',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: amber),
                              SizedBox(width: 2),
                              Text('($reviews +)',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: color,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(width: 100),
                    Text('OPEN',
                        style: TextStyle(
                          color: green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 30,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(.0),
                        child: Text(type,
                            style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.timer, color: black),
                  SizedBox(width: 3),
                  Text(prepTime,
                      style: TextStyle(
                        color: green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('${popularFoods[0]}',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('${popularFoods[1]}',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('${popularFoods[2]}',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
