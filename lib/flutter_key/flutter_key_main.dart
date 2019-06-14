

import 'package:flutter/material.dart';
import 'package:flutter_first_demo/flutter_key/key_statefull_key.dart';
import 'package:flutter_first_demo/flutter_key/key_statefull_nokey.dart';
import 'package:flutter_first_demo/flutter_key/key_stateless_nokey.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';

class KeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对于Key的理解"),
      ),
      body: ListView(
        children: <Widget>[

          MaterialButton(onPressed: (){
            RouterUtil.route4Animation(context, StatelessNoKey(),RouterUtil.FADE);
          } , child: Text("statelessWidget 无key"),),

          MaterialButton(onPressed: (){
            RouterUtil.route4Animation(context, StateFullNoKey(),RouterUtil.FADE);
          } , child: Text("statefullWidget 无key"),),


          MaterialButton(onPressed: (){
            RouterUtil.route4Animation(context, StateFullKey(),RouterUtil.FADE);
          } , child: Text("statefullWidget 有key"),),

        ],
        padding: EdgeInsets.all(10),

      ),
    );
  }

}