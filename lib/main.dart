import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_demo/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


    return MaterialApp(
      title: 'Moon Flutter',
      // 设置主题
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: MainPage(),

      // 去掉 标题栏"debug" 标志
//      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(HomePage());



