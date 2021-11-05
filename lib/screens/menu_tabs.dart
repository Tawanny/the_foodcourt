import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories_provider.dart';
import '../widgets/category_item.dart';
import '../models/theme_colors.dart';

class MenuTabs extends StatefulWidget {
  static const routeName = '/menu_tabs';
  @override
  _MenuTabsState createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs> with SingleTickerProviderStateMixin {
  // TabController _tabController;
  // var _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //     length: 10,
  //     vsync: this,
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoriesProvider>(context);

    return DefaultTabController(
      length: 10,
      child: Scaffold(
        backgroundColor: amber,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Menu',
            style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          bottom: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: green,
            ),
            unselectedLabelColor: green,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            tabs: [
              Tab(text: 'Tapas'),
              Tab(text: 'Starters'),
              Tab(text: 'Burgers'),
              Tab(text: 'Salads'),
              Tab(text: 'Pastas'),
              Tab(text: 'Steaks'),
              Tab(text: 'Hearty Meals'),
              Tab(text: 'Coffees'),
              Tab(text: 'Breakfast'),
              Tab(text: 'Desserts'),
            ],
          ),
        ),
        body: TabBarView(
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
        ),
      ),
    );
  }
}
