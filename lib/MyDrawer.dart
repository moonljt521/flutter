
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/calculator/Calculator.dart';
import 'package:flutter_first_demo/ReciteWords.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
import "package:share/share.dart";

import 'package:flutter_share_me/flutter_share_me.dart';


class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget userHeader = UserAccountsDrawerHeader(
      accountName:
         Container(
          margin: EdgeInsets.only(top : 20),
          padding: EdgeInsets.only(top : 10, right : 10, bottom: 10),
          child: Text("moon",
            style: TextStyle(
              fontSize: 20
            ) ,
          ),
      ),
      accountEmail: Container(
        padding: EdgeInsets.only(top : 10, right : 10, bottom: 10),
        child: Text("moonljt521@126.com",
          style: TextStyle(
              fontSize: 17
          ) ,
        ),
      ),
      currentAccountPicture: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
          RouterUtil.routeAnimation(context, LoginPage());
        },
        child: new CircleAvatar(
          backgroundImage: AssetImage('images/ic_launcher.png'),
          radius: 30.0,
        ),
      )
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          userHeader, // 可在这里替换自定义的header
          ListTile(
              title: Text('计算器'),
              leading: CircleAvatar(
                child: Icon(Icons.computer),
              ),
              onTap: () {
                Navigator.of(context).pop();
                RouterUtil.routeAnimation(context, Calculator());
              }
          ),
          ListTile(
              title: Text('单词表'),
              leading: CircleAvatar(
                child: Text('B2'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                RouterUtil.route(context, ReciteWords());
              }

          ),
          ListTile(
            title: Text('待开发功能2'),
            leading: CircleAvatar(
              child: Icon(Icons.list),
            ),
            onTap: () {
//                  Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Share'),
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            onTap: () {
              Navigator.of(context).pop();
//              Share.share(
//                  "我的flutter" + (Platform.isAndroid ? "https://play.google.com/store/apps/details?id=com.twodimensions.timeline" : "itms://itunes.apple.com/us/app/apple-store/id1441257460?mt=8"));

//               FlutterShareMe().shareToFacebook(url: "",msg: "1111");

            },
          ),
        ],
      ),
    );;
  }


}