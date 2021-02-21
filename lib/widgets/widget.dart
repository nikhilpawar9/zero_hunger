import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      height: 50,
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black38,
    ),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black87, fontSize: 16);
}

TextStyle mediumTextStyle() {
  return TextStyle(
    fontSize: 17,
    color: Colors.black87,
  );
}
