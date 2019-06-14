import 'dart:math';

import 'package:flutter/material.dart';

class UniqueColorGenerator {
  List<Color> colorList = [Colors.blue, Colors.yellow, Colors.red];

  Random random = new Random();

  Color getColor() {
    return colorList[random.nextInt(3)];
  }
}