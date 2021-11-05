import 'package:flutter/material.dart';

import '../models/helper.dart';
import '../models/theme_colors.dart';
import './custom_text_input.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getScreenHeight(context) * 0.7,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.clear,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Add Credit/Debit Card",
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Divider(
                color: amber.withOpacity(0.5),
                thickness: 1.5,
                height: 40,
              ),
              CustomTextInput(hintText: "card Number"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Expiry"),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: CustomTextInput(
                      hintText: "MM",
                      padding: const EdgeInsets.only(left: 35),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: CustomTextInput(
                      hintText: "YY",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextInput(hintText: "Security Code"),
              SizedBox(
                height: 20,
              ),
              CustomTextInput(hintText: "First Name"),
              SizedBox(
                height: 20,
              ),
              CustomTextInput(hintText: "Last Name"),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Container(
                  width: 200,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: green, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: FlatButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.add),
                    label: Text(
                      'Add Card',
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
