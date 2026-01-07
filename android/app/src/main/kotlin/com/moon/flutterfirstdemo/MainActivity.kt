package com.moon.flutterfirstdemo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.moon.myflutterplugin.MyFlutterPlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // 注册自定义插件
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.moon.plugin/my_flutter_plugin")
            .setMethodCallHandler(MyFlutterPlugin())
    }
}
