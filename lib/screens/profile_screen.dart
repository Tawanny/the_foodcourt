import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../models/theme_colors.dart';
import '../widgets/navigation_bar.dart';
import './filters_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var yTransValue = 0.0;

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
      child: Scaffold(
        backgroundColor: white,
        body: getBody(),
        floatingActionButton: AnimatedContainer(duration: Duration(milliseconds: 300), transform: Matrix4.translationValues(0, yTransValue, 0), child: NavigationBar()),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_outlined),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(FiltersScreen.routeName);
                        },
                        icon: Icon(Icons.settings),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.4,
                        child: Container(
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: -2,
                                child: CircularPercentIndicator(circularStrokeCap: CircularStrokeCap.round, backgroundColor: grey.withOpacity(0.3), radius: 110.0, lineWidth: 6.0, percent: 0.53, progressColor: amber),
                              ),
                              Positioned(
                                top: 16,
                                left: 13,
                                child: Container(
                                  width: 85,
                                  height: 85,
                                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/images/foodcourtlogo.png'), fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Danny Mutumbami",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
                            ),
                            Text(
                              "danny@shadownettech.com",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: black.withOpacity(0.4)),
                            ),
                            Text(
                              "+2784 714 6843",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: black.withOpacity(0.4)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Accumulated Points: 73.50",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: green),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        tailoredCard(title: 'Notifications', icon: Icons.notifications),
                        tailoredCard(title: 'Payment Methods', icon: Icons.credit_card),
                        tailoredCard(title: 'Delivery Location', icon: Icons.location_on),
                        tailoredCard(title: 'Order History', icon: Icons.article_outlined),
                        tailoredCard(title: 'Favorite Meals', icon: Icons.favorite_outlined),
                        tailoredCard(title: 'Accounts and Credit', icon: Icons.account_balance_wallet),
                        tailoredCard(title: 'Settings', icon: Icons.settings),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tailoredCard({String title, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 1,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            size: 36,
            color: green,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: black),
      ),
    );
  }
}
