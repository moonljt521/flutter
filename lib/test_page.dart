


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_first_demo/base/base_toolbar_widget.dart';

class TestWidget extends BaseStatefulWidget {


  @override
  Widget getWidget(BuildContext context) {


    return Center(
      child: Text("test"),
    );
  }

  @override
  String getTitle() {
    return "自定义标题";
  }


}