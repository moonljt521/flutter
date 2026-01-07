package com.moon.myflutterpluginexample

import android.app.Application

/**
 * author: jiangtao.liang
 * date:   On 2019/1/3 10:50
 */

class MyApp : Application() {

    companion object {
        lateinit var application : Application
    }

    override fun onCreate() {
        super.onCreate()
        application = this
    }
}