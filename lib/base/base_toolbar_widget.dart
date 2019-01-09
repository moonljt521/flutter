import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/utils/Toast.dart';


/**
 *  toolbar  statefulWidget 基类
 */
abstract class BaseStatefulWidget extends StatefulWidget {

  State<BaseStatefulWidget> state;



  @protected
  Widget getWidget(BuildContext context);

  @protected
  String getTitle();

  @override
  createState() => _BaseState();


  void initState() {}

  void dispose() {}

  @protected
  backPopPage(BuildContext context){
      if(state == null) return;
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
    widget.state = this;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.54),
        ),
        title: Text(widget.getTitle() ,style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(1.0))),
        elevation: 1.0,
        centerTitle: true,
        automaticallyImplyLeading:false
,
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
      body: widget.getWidget(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }
}
