import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_demo/HomeWidget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return new MaterialApp(
      title: 'Welcome to Flutter',
      // 设置主题
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: HomeWidget(),
    );
  }
}

void main() => runApp(new HomePage());



