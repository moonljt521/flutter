import 'dart:async';

import 'package:flutter/services.dart';

class MyFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('com.moon.plugin/my_flutter_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // toast 调用原生
  static Future<void> showToast(String message) async {
    await _channel.invokeMethod('toast', {"message" : message});
  }

  // 调用一个1像素大小的原生的dialog
  static Future<void> showHideDialog() async {
    await _channel.invokeMethod('onePxDialog');
  }

}
