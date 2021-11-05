import 'package:flutter/material.dart';

import '../models/theme_colors.dart';
import '../widgets/navigation_bar.dart';
import './meals_tab.dart';
import './bookings_screen.dart';
import './profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;
  var yTransValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(ProfileScreen.routeName),
                      child: CircleAvatar(
                        child: Icon(Icons.person, size: 30),
                      ),
                    ),
                  ),
                  title: Center(
                    child: RichText(
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
                  ),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 50),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    //indicator: BoxDecoration(borderRadius: BorderRadius.circular(10), color: green),
                    tabs: [
                      Tab(
                        text: 'Meals',
                      ),
                      Tab(
                        text: 'Bookings',
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ];
            },
            body: TabBarView(
              children: [
                MealsTab(),
                BookingsScreen(),
              ],
            ),
          ),
          floatingActionButton: AnimatedContainer(duration: Duration(milliseconds: 300), transform: Matrix4.translationValues(0, yTransValue, 0), child: NavigationBar()),
        ),
      ),
    );
  }
}
