import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme_colors.dart';
import '../providers/categories_provider.dart';
import '../providers/restaurants_provider.dart';

import '../widgets/category_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/main_drawer.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categoriesScreen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var yTransValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final restId = ModalRoute.of(context).settings.arguments as String;
    final categoryData = Provider.of<CategoriesProvider>(context);
    final restData = Provider.of<RestaurantsProvider>(context);
    final restaurant = restData.findById(restId);
    final catList = categoryData.getCategories;

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        if (notification.scrollDelta.sign == 1) {
          setState(() {
            yTransValue = 100;
          });
        } else if (notification.scrollDelta.sign == -1) {
          setState(() {
            yTransValue = 0;
          });
        }
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(190.0), // here the desired height
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    color: amber,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: green,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: green,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: green.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  restaurant.name,
                                  style: TextStyle(color: black, fontWeight: FontWeight.w700, fontSize: 23),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(restaurant.logo), fit: BoxFit.cover), shape: BoxShape.circle, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            drawer: MainDrawer(),
            body: GridView(
              padding: const EdgeInsets.all(25),
              children: categoryData.getCategories
                  .map(
                    (catData) => CategoryItem(
                      catData.id,
                      catData.title,
                      catData.color,
                      catData.restId,
                      catData.imageUrl,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
            floatingActionButton: AnimatedContainer(duration: Duration(milliseconds: 300), transform: Matrix4.translationValues(0, yTransValue, 0), child: NavigationBar()),
          ),
        ],
      ),
    );
  }
}
