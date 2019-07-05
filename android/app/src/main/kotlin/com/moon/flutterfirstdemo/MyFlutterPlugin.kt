package com.moon.myflutterplugin

import android.util.Log
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.moon.myflutterpluginexample.MyApp

class MyFlutterPlugin : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "com.moon.plugin/my_flutter_plugin")
            channel.setMethodCallHandler(MyFlutterPlugin())
        }
    }

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

        }
    }
}
