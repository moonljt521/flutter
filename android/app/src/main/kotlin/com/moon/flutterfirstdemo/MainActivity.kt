package com.moon.flutterfirstdemo

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.MyFlutterPlugin

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        registerCustomPlugin(this)
    }

    fun registerCustomPlugin(registrar: PluginRegistry) {
        MyFlutterPlugin.registerWith(registrar.registrarFor("com.moon.plugin/my_flutter_plugin"));
    }
}
