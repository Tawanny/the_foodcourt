import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../models/theme_colors.dart';
import '../models/helper.dart';
import '../screens/filters_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/basket_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/about_screen.dart';
import '../screens/home_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.amber[100],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlurryContainer(
        padding: EdgeInsets.all(20),
        bgColor: Colors.black54,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(25)),
        child: Column(
          children: <Widget>[
            Container(
              height: 130,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Helper.getAssetName('foodcourtlogo.png')),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'The Food',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Court',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              'Home',
              Icons.home,
              () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            buildListTile(
              'Your Order Basket',
              Icons.shopping_basket,
              () {
                Navigator.of(context).pushReplacementNamed(BasketScreen.routeName);
              },
            ),
            buildListTile(
              'CheckOut',
              Icons.payment,
              () {
                Navigator.of(context).pushReplacementNamed(CheckoutScreen.routeName);
              },
            ),
            buildListTile(
              'Settings',
              Icons.settings_outlined,
              () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              },
            ),
            buildListTile(
              'Your Profile',
              Icons.person,
              () {
                Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
              },
            ),
            SizedBox(height: 100),
            buildListTile(
              'About Us',
              Icons.developer_board,
              () {
                Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
