import 'package:flutter/material.dart';
import 'package:flutter_first_demo/calculator/Calculator.dart';
import 'package:flutter_first_demo/MyDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      // 设置主题
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('主页'),

        ),
        body: new Center(
          child: new Text("Flutter Demo"),

        ),
        drawer: new MyDrawer(),
      ),
    );
  }
}
