import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * route 封装
 */
class RouterUtil {
  static route(BuildContext context, Widget targetWidget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (mContext) => targetWidget));
  }

  static routeAnimation(BuildContext context, Widget targetWidget) {
    Navigator.of(context)
        .push(_MyCustomRoute(builder: (context) => targetWidget));
  }
}

class _MyCustomRoute<T> extends MaterialPageRoute<T> {
  _MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return RotationTransition(turns: animation, child: child);
    return FadeTransition(opacity: animation, child: child);
  }
}
