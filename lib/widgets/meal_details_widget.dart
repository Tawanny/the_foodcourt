import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../models/theme_colors.dart';

class MealDetailsWidget extends StatelessWidget {
  final double price;
  final int numOfReviews;
  final double rating;
  final String name;
  final RatingChangeCallback onRatingChanged;

  const MealDetailsWidget({
    Key key,
    this.price,
    this.numOfReviews,
    this.rating,
    this.name,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  SmoothStarRating(
                    borderColor: amber,
                    rating: rating,
                    // onRatingChanged: onRatingChanged,
                  ),
                  SizedBox(height: 5.0),
                  Text("$numOfReviews reviews"),
                ],
              ),
            ],
          ),
        ),
        priceTag(context, price: price),
      ],
    );
  }

  ClipPath priceTag(BuildContext context, {double price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 66,
        width: 65,
        color: amber,
        child: Text(
          "\$$price",
          style: Theme.of(context).textTheme.title.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
