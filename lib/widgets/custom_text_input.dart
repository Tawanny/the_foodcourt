import 'package:flutter/material.dart';
import '../models/theme_colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    @required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    Key key,
  })  : _hintText = hintText,
        _padding = padding,
        super(key: key);

  final String _hintText;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: ShapeDecoration(
        color: amber.withOpacity(0.5),
        shape: StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: black,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
