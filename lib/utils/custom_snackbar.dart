import 'package:flutter/material.dart';
import 'package:user_authentication/utils/colorcode.dart';

void showSnackBar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        fontFamily: 'Roboto',
        color: Colors.white,
      ),
    ),
    backgroundColor: ColorCode.dark_navy_blue,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
