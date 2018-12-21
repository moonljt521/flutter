

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 计算器
 */
class Calculator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('计算器'),

      ),
      body: new Center(
        child : new Text("计算器")
      )
    );
  }

}