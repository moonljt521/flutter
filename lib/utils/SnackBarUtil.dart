
import 'package:flutter/material.dart';

class SnackBarUtil {

  static showSnackBar(BuildContext context , String text) {
    final snackBar = SnackBar(content: Text(text) , duration: new Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}