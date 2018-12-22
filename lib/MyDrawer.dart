
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/calculator/Calculator.dart';
import 'package:flutter_first_demo/ReciteWords.dart';


class MyDrawer extends StatelessWidget {

  // 抽屉
  Widget userHeader = UserAccountsDrawerHeader(
    accountName: new Text('Moon'),
    accountEmail: new Text('moonljt521@gmail.com'),
    currentAccountPicture: new CircleAvatar(
      backgroundImage: AssetImage('images/ic_launcher.png'),
      radius: 35.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          userHeader, // 可在这里替换自定义的header
          ListTile(
              title: Text('计算器'),
              leading: new CircleAvatar(
                child: new Icon(Icons.computer),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (mContext) => new Calculator()));
              }
          ),
          ListTile(
              title: Text('单词表'),
              leading: new CircleAvatar(
                child: new Text('B2'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ReciteWords()));
              }

          ),
          ListTile(
            title: Text('待开发功能2'),
            leading: new CircleAvatar(
              child: new Icon(Icons.list),
            ),
            onTap: () {
//                  Navigator.pop(context);
            },
          ),
        ],
      ),
    );;
  }


}