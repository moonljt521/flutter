package com.moon.myflutterplugin

import android.util.Log
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.moon.myflutterpluginexample.MyApp

class MyFlutterPlugin : MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
            // flutter -> toast
        } else if (call.method == "toast") {
            val msg: String? = call.argument("message");
            Toast.makeText(MyApp.application, msg, Toast.LENGTH_SHORT).show()
        } else if (call.method == "onePxDialog"){
            result.notImplemented()
        } else {
            result.notImplemented()
        }
    }
}
