import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  static const routeName = './bookings_screen';
  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('Coming Soon!'),
      ),
    );
  }
}
