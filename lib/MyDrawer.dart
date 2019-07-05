
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/ReciteWords.dart';
import 'package:flutter_first_demo/bloc/test_bloc_page.dart';
import 'package:flutter_first_demo/bloc/test_stream_page.dart';
import 'package:flutter_first_demo/bottom_picker_page/bottom_picker.dart';
import 'package:flutter_first_demo/cached_network_image/cached_network_image_page.dart';
import 'package:flutter_first_demo/calculator/Calculator.dart';
import 'package:flutter_first_demo/countdown/CountDownPage.dart';
import 'package:flutter_first_demo/custom_widget/custom_widget_list_page.dart';
import 'package:flutter_first_demo/datepicker/datepicker.dart';
import 'package:flutter_first_demo/flutter_key/flutter_key_main.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/touch/test_touch.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget userHeader = UserAccountsDrawerHeader(
      accountName:
         Container(
          margin: EdgeInsets.only(top : 20),
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
            title: Text('自定义封装波轮菜单'),
            leading: CircleAvatar(
              child: Icon(Icons.details),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, BottomPicker());
            },
          ),


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
            title: Text('flutter Key 使用'),
            leading: CircleAvatar(
              child: Icon(Icons.access_time),
            ),
            onTap: () {
              Navigator.of(context).pop();
              RouterUtil.route4Animation(context, KeyPage(),RouterUtil.FADE);

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

          ListTile(
            title: Text('自定义widget'),
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, CustomWidgetList());
            },
          ),

          ListTile(
            title: Text('测试onTouch'),
            leading: CircleAvatar(
              child: Icon(Icons.details),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, MyTouch());
            },
          ),

          ListTile(
            title: Text('Glide 封装'),
            leading: CircleAvatar(
              child: Icon(Icons.details),
            ),
            onTap: () {
              RouterUtil.routeAnimation(context, CachedNetWorkPage());
            },
          ),


        ],
      ),
    );;
  }

}