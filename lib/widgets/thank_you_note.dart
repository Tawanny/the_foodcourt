import 'package:flutter/material.dart';

import '../models/helper.dart';
import '../models/theme_colors.dart';
import '../screens/meals_tab.dart';
import '../screens/order_tracking_screen.dart';

class ThankYouNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getScreenHeight(context) * 0.7,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
            Image.asset(
              Helper.getAssetName(
                "vector4.png",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Thank You!",
              style: TextStyle(
                color: amber,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "for your order",
              style: TextStyle(
                color: black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Your order is now being processed. We will notify you Once the order is on its way. Check your order Status below",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: FlatButton.icon(
                  onPressed: () {
                    // showModalBottomSheet(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     isScrollControlled: true,
                    //     isDismissible: false,
                    //     context: context,
                    //     builder: (context) {
                    //       return ThankYouNote();
                  },
                  icon: Icon(Icons.track_changes),
                  label: Text(
                    'Track My Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(MealsTab.routeName);
                },
                child: Text(
                  "Back To Home",
                  style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
