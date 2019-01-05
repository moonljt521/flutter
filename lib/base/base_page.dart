import 'package:flutter/cupertino.dart';


/**
 *  statefulwidget 基类
 */
abstract class BasefulWidget extends StatefulWidget {

  State<BasefulWidget> state;

  @override
  createState() {

    state = _BasefulWidgetState();
  }

  @protected
  Widget build(BuildContext context);

  void initState() {
  }

  void dispose() {}
}

class _BasefulWidgetState extends State<BasefulWidget> {

  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }
}
