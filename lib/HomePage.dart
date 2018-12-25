import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_demo/MyDrawer.dart';
import 'package:flutter_first_demo/utils/SnackBarUtil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  _showDialog(BuildContext mContext) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(content: new Text('退出app'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();

              }
            },
            child: new Text('确定'))
      ]),
    );
  }

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
        body: WillPopScope(
            onWillPop:() {

              print("_requsetPop....");

              _showDialog(context);

              return new Future.value(false);
            },
            child: new Text("qqqq"),
          ),
        drawer: new MyDrawer(),
        ),
      );
  }
}





