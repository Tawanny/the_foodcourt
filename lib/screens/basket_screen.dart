import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/helper.dart';
import '../models/theme_colors.dart';
import '../providers/cart_provider.dart' show CartProvider;
import '../providers/orders_provider.dart';
import '../widgets/basket_item.dart';
import '../widgets/main_drawer.dart';
import './checkout_screen.dart';
import './home_screen.dart';

class BasketScreen extends StatelessWidget {
  static const routeName = '/basketScreen';
  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: white,
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: amber, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
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
                            color: black,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: black,
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
                          Text(
                            'Your Order Basket',
                            style: TextStyle(color: black, fontWeight: FontWeight.w700, fontSize: 23),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  Helper.getAssetName(
                                    'foodcourtlogo.png',
                                  ),
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            basket.getItemCount == 0 ? SizedBox(height: 100) : SizedBox(height: 0),
            basket.getItemCount == 0
                ? Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_basket,
                            size: 80,
                            color: black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Container(child: Text('Good food is always cooking. Go ahead and Order you wont be disappointed')),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: basket.getItemCount,
                      itemBuilder: (ctx, i) => BasketItem(
                        basket.getItems.values.toList()[i].id,
                        basket.getItems.keys.toList()[i],
                        basket.getItems.values.toList()[i].title,
                        basket.getItems.values.toList()[i].quantity,
                        basket.getItems.values.toList()[i].price,
                      ),
                    ),
                  ),
            basket.getItemCount == 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
                      child: Text('Go To Home Screen',
                          style: TextStyle(
                            color: green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )
                : Card(
                    color: amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          Chip(
                            label: Text('R${basket.getTotalAmount}'),
                            backgroundColor: green,
                          ),
                          FlatButton(
                            child: Text('Place Order!'),
                            onPressed: () {
                              Provider.of<Orders>(context, listen: false).addOrders(basket.getItems.values.toList(), basket.getTotalAmount);
                              basket.clearCart();
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.grey[200],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  title: Text(
                                    'Your Order has been Successfully Placed!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: black,
                                    ),
                                  ),
                                  actionsPadding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(color: green, borderRadius: BorderRadius.all(Radius.circular(10))),
                                          child: FlatButton(
                                            onPressed: () => Navigator.of(context).pushReplacementNamed(CheckoutScreen.routeName),
                                            child: Text(
                                              'Proceed To Checkout',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        FlatButton(
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                          child: Text(
                                            'Back To Menu',
                                            style: TextStyle(
                                              color: green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                                          },
                                        ),
                                      ],
                                    ),

                                    // RaisedButton(
                                    //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    //   color: Theme.of(context).accentColor,
                                    //   textColor: Colors.black,
                                    //   child: Text('Proceed to CheckOut'),
                                    //   onPressed: () {
                                    //     // Navigator.of(ctx).pop(true);
                                    //     Navigator.of(context).pushReplacementNamed(CheckoutScreen.routeName);
                                    //   },
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
