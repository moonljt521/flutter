import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * router 封装
 */
class RouterUtil {

  static const ROUTE = 1;
  static const FADE = 2;

  static route(BuildContext context, Widget targetWidget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (mContext) => targetWidget));
  }

  static routeAnimation(BuildContext context, Widget targetWidget) {
    Navigator.of(context)
        .push(_MyCustomRoute(builder: (context) => targetWidget));
  }

  static route4Animation(BuildContext context, Widget targetWidget , num type) {
    Navigator.of(context)
        .push(_MyCustomRoute(builder: (context) => targetWidget , type : type));
  }
}

class _MyCustomRoute<T> extends MaterialPageRoute<T> {

  num mType = 2;

  _MyCustomRoute({WidgetBuilder builder, RouteSettings settings , var type})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    if(mType == 1){
      return RotationTransition(turns: animation, child: child);
    }else if(mType == 2){
      return FadeTransition(opacity: animation, child: child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}