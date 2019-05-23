import 'package:flutter/material.dart';
import 'package:flutter_first_demo/custom_widget/chessboard_page.dart';
import 'package:flutter_first_demo/custom_widget/custom_roate.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';

class CustomWidgetList extends StatefulWidget {
  @override
  _CustomWidgetListState createState() => new _CustomWidgetListState();
}

class _CustomWidgetListState extends State<CustomWidgetList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
    title: Text("自定义widget"),
    ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text("旋转view"),
            onTap: (){
              RouterUtil.routeAnimation(context, TurnBoxRoute());
            },
          ),
          Container(
            height: 1,
            color: Colors.red,
          ),
          ListTile(title: Text("棋盘"),
            onTap: (){
              RouterUtil.routeAnimation(context, CustomPaintRoute());
            },
          ),
          Container(
            height: 1,
            color: Colors.red,
          ),


        ],
      )
    );
  }
}