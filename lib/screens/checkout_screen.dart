import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme_colors.dart';
import '../models/helper.dart';
import '../providers/cart_provider.dart' show CartProvider;
import '../widgets/add_card.dart';
import '../widgets/thank_you_note.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout_screen';
  var subtotal = 0.0;
  var deliveryFee = 50.0;
  var discount = 0.0;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void setState(fn) {
    super.setState(fn);
    widget.discount = widget.subtotal * 0.3;
  }

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<CartProvider>(context);
    var total = widget.subtotal - (widget.discount + widget.deliveryFee);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    SizedBox(width: 70),
                    Expanded(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: green,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Delivery Address"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Helper.getScreenWidth(context) * 0.4,
                      child: Text(
                        "34 Scott Street. Upington CBD",
                        style: TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(ChangeAddressScreen.routeName);
                      },
                      child: Text(
                        "Change",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 5),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment method"),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: white,
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return AddCard();
                            });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          Text(
                            "Add Card",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cash on delivery"),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset(
                            Helper.getAssetName(
                              "visa2.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("**** **** **** 2187"),
                      ],
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PaymentCard(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 30,
                          child: Image.asset(
                            Helper.getAssetName(
                              "paypal.png",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("johndoe@email.com"),
                      ],
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(color: black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(thickness: 5),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total"),
                        Text(
                          'R${widget.subtotal}',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Cost"),
                        Text(
                          'R${widget.deliveryFee}',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discount"),
                        Text(
                          'R${widget.discount}',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 40,
                      color: amber.withOpacity(0.25),
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text(
                          widget.subtotal <= 0 ? 'R0.0' : 'R$total',
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 5),
              SizedBox(
                height: 20,
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
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          isScrollControlled: true,
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return ThankYouNote();
                          });
                    },
                    icon: Icon(Icons.send_outlined),
                    label: Text(
                      'Send Order',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key key,
    Widget widget,
  })  : _widget = widget,
        super(key: key);

  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 30,
            right: 20,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: amber.withOpacity(0.25),
              ),
            ),
            color: amber,
          ),
          child: _widget),
    );
  }
}
