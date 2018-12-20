
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtil {

  static showSnackBar(BuildContext context , String text) {
    final snackBar = SnackBar(content: Text(text) , duration: new Duration(seconds: 1),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}