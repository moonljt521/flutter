import 'package:flutter/material.dart';

/**
 *  toolbar  statefulWidget 基类
 */
abstract class BaseStatefulWidget extends StatefulWidget {

  // Removed mutable state field to fix immutability warning

  @protected
  Widget getWidget(BuildContext context);

  @protected
  String getTitle();

  @override
  createState() => _BaseState();

  @protected
  void initState() {}

  @protected
  void dispose() {}

  @protected
  backPopPage(BuildContext context){
     Navigator.pop(context, true);
  }
}

class _BaseState extends State<BaseStatefulWidget> {

  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.54),
        ),
        title: Text(widget.getTitle() ,style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(1.0))),
        elevation: 1.0,
        centerTitle: true,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_ios),
          padding: EdgeInsets.only(left: 20.0,),
          color: Colors.black.withOpacity(0.5),
          onPressed: () {
            widget.backPopPage(context);
          },
        ),
      ),
      body: new WillPopScope(
          child: Scaffold(
            body: widget.getWidget(context)
          ),
          onWillPop: () {
            print("返回键点击了");
            widget.backPopPage(context);
            return Future.value(false);
          })
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }
}
