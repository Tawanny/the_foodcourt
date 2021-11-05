import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme_colors.dart';
import '../providers/cart_provider.dart';

class BasketItem extends StatefulWidget {
  final String prodId;
  final String id;
  final String title;
  int quantity;
  final double price;

  BasketItem(
    this.prodId,
    this.id,
    this.title,
    this.quantity,
    this.price,
  );

  @override
  _BasketItemState createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    if (widget.quantity <= 0) {
      setState(() {
        widget.quantity = 0;
      });
    }
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Please Confirm Action!'),
            content: Text(
              'Are You Sure you want to delete this item from Your Basket?',
              softWrap: true,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        cart.removeItem(widget.id);
      },
      key: ValueKey(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Icon(
          Icons.delete_forever_outlined,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.amber, width: 1),
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.quantity} x',
                softWrap: true,
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Container(
                width: 150,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                'R${(widget.price * widget.quantity)}',
                softWrap: true,
                style: TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.quantity += 1;
                        cart.addItem(widget.id, widget.title, widget.price);
                      });
                    },
                    icon: Icon(Icons.add, color: amber),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.quantity -= 1;
                        if (widget.quantity == 0) {
                          cart.removeItem(widget.id);
                        }
                      });
                    },
                    icon: Icon(Icons.remove, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
