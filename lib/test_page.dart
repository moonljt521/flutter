
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_first_demo/base/base_toolbar_widget.dart';
import 'package:flutter_first_demo/utils/Toast.dart';

class TestWidget extends BaseStatefulWidget {


  @override
  Widget getWidget(BuildContext context) {
    return Center(
      child: Text("ddd"),
    );
  }

  @override
  String getTitle() {
    return "自定义标题";
  }

  @override
  backPopPage(BuildContext context) {
    Navigator.pop(context, "11122211");

//    return super.backPopPage(context);
  }



}