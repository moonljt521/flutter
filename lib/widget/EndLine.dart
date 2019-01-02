import 'package:flutter/material.dart';

class EndLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(height: 10.0,),
            flex: 1,
          ),
          Text("我是有底线的",style: TextStyle(color: Theme.of(context).accentColor),),
          Expanded(
            child: Divider(height: 10.0,),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(height: 10.0,),
            flex: 1,
          ),
          Text("暂无数据",style: TextStyle(color: Theme.of(context).accentColor),),
          Expanded(
            child: Divider(height: 10.0,),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
