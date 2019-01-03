package com.moon.myflutterpluginexample

import android.app.Application
import io.flutter.app.FlutterApplication

/**
 * author: jiangtao.liang
 * date:   On 2019/1/3 10:50
 */

class MyApp : FlutterApplication() {

    companion object {
        lateinit var application : Application

    }

    override fun onCreate() {
        super.onCreate()
        application = this;
    }

}