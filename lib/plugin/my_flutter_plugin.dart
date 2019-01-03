import 'dart:async';

import 'package:flutter/services.dart';

class MyFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('com.moon.plugin/my_flutter_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // toast 调用原生
  static Future showToast(String message) {
    _channel.invokeMethod('toast', {"message" : message});
  }

}
