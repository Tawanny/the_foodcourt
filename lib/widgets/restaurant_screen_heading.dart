import 'package:flutter/material.dart';

import '../models/theme_colors.dart';
import 'package:provider/provider.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../providers/restaurants_provider.dart';
import '../providers/cart_provider.dart';

class RestaurantHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restId = ModalRoute.of(context).settings.arguments as String;
    final restData = Provider.of<RestaurantsProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    final restList = restData.getRestaurants;
    final selectedRestaurant = restData.findById(restId);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 340,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(
                          selectedRestaurant.imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: BlurryContainer(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  bgColor: Color(0xff141921),
                  width: 350,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        selectedRestaurant.name,
                        style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        selectedRestaurant.type,
                        style: TextStyle(
                          color: amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      SmoothStarRating(
                        borderColor: selectedRestaurant.color,
                        rating: selectedRestaurant.rating,
                        // onRatingChanged: onRatingChanged,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
