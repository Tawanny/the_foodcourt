import 'package:flutter/material.dart';
import '../models/style_scheme.dart';
//import 'OrderConfirmPage.dart';

class OrderTrackingScreen extends StatefulWidget {
  static const routeName = '\order_tracking';

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text(
          "Track Order",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Number 1001",
                  style: headingStyle,
                ),
                Text(
                  "Order confirmed. Ready to pick",
                  style: contentStyle.copyWith(color: Colors.grey, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 1,
                  color: Colors.grey,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13, top: 50),
                      width: 4,
                      height: 400,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        statusWidget('confirmed', "Confirmed", true),
                        statusWidget('onBoard2', "Picked Up", false),
                        statusWidget('servicesImg', "In Pricess", false),
                        statusWidget('shipped', "Shipped", false),
                        statusWidget('Delivery', "Delivered", false),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  height: 1,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.orange,
                          )),
                      child: Text(
                        "Cancel Order",
                        style: contentStyle.copyWith(color: Colors.orange),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orange,
                      ),
                      child: Text(
                        "My Orders",
                        style: contentStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container statusWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(shape: BoxShape.circle, color: (isActive) ? Colors.orange : Colors.white, border: Border.all(color: (isActive) ? Colors.transparent : Colors.orange, width: 3)),
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/$img.png"), fit: BoxFit.contain)),
              ),
              Text(
                status,
                style: contentStyle.copyWith(color: (isActive) ? Colors.orange : Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
