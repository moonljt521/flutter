
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/ReciteWords.dart';
import 'package:flutter_first_demo/bloc/test_bloc_page.dart';
import 'package:flutter_first_demo/bloc/test_stream_page.dart';
import 'package:flutter_first_demo/calculator/Calculator.dart';
import 'package:flutter_first_demo/countdown/CountDownPage.dart';
import 'package:flutter_first_demo/datepicker/datepicker.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/test_page.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
//import 'packages:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

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
          userHeader,
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
            title: Text('日历'),
            leading: CircleAvatar(
              child: Icon(Icons.list),
            ),
            onTap: () {
              Navigator.of(context).pop();

              RouterUtil.routeAnimation(context, DatePickerPage());

            },
          ),

          ListTile(
            title: Text('模拟闪屏页'),
            leading: CircleAvatar(
              child: Icon(Icons.access_time),
            ),
            onTap: () {
              Navigator.of(context).pop();
              RouterUtil.route4Animation(context, CountDownPage(),RouterUtil.FADE);

            },
          ),
          
          ListTile(
            title: Text('test 页面基类'),
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            onTap: () {

              RouterUtil.routeAnimation(context, TestWidget());

            },
          ),

          ListTile(
            title: Text('测试StreamBuilder更新UI'),
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, CounterPage());
            },
          ),

          ListTile(
            title: Text('测试Bloc更新UI'),
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, BlocCounterPage());
            },
          ),

        ],
      ),
    );;
  }

  goTo(BuildContext context){
    print("111112");
    RouterUtil.routeAnimation(context, Calculator());
  }

}