import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:flutter/rendering.dart';

import '../models/theme_colors.dart';
import '../screens/filters_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/basket_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/checkout_screen.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> with SingleTickerProviderStateMixin {
  MotionTabController _tabController;
  var isScrollingDown = false;
  var isOnTop = true;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FabCircularMenu(ringColor: Colors.transparent, ringWidth: 45, ringDiameter: 300, children: <Widget>[
        menuItem(
          ctx: context,
          icon: Icons.person,
          routeName: ProfileScreen.routeName,
        ),
        menuItem(
          ctx: context,
          icon: Icons.favorite,
          routeName: FavoritesScreen.routeName,
        ),
        menuItem(
          ctx: context,
          icon: Icons.settings,
          routeName: FiltersScreen.routeName,
        ),
        menuItem(
          ctx: context,
          icon: Icons.credit_card,
          routeName: CheckoutScreen.routeName,
        ),
        menuItem(
          ctx: context,
          icon: Icons.shopping_basket,
          routeName: BasketScreen.routeName,
        ),
        menuItem(
          ctx: context,
          icon: Icons.home,
          routeName: HomeScreen.routeName,
        ),
      ]),
    );

    // Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: FloatingNavbar(
    //     backgroundColor: Colors.black54,
    //     selectedItemColor: black,
    //     unselectedItemColor: amber,
    //     selectedBackgroundColor: green,
    //     borderRadius: 70,
    //     itemBorderRadius: 30,
    //     onTap: (int val) {
    //       setState(() {
    //         _index = val;
    //       });
    //       if (_index == 0) {
    //         Navigator.of(context).pushNamed(MealsTab.routeName);
    //       }
    //       if (_index == 1) {
    //         Navigator.of(context).pushNamed(CategoriesScreen.routeName);
    //       }
    //       if (_index == 2) {
    //         Navigator.of(context).pushNamed(BasketScreen.routeName);
    //       }
    //     },
    //     currentIndex: _index,
    //     items: [
    //       FloatingNavbarItem(icon: Icons.home_outlined, title: 'Home'),
    //       FloatingNavbarItem(
    //         icon: Icons.menu_book_outlined,
    //         title: 'Menu',
    //       ),
    //       //FloatingNavbarItem(icon: Icons.favorite_outlined, title: 'Favorites'),
    //       FloatingNavbarItem(icon: Icons.shopping_basket_outlined, title: 'Basket'),
    //     ],
    //   ),
    // );
  }

  Widget menuItem({BuildContext ctx, IconData icon, String routeName}) {
    return IconButton(
        iconSize: 35,
        color: amber,
        icon: Icon(icon),
        onPressed: () {
          Navigator.of(ctx).pushNamed(routeName);
        });
  }
}
