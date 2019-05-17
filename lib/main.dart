import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_demo/main_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {});


    return MaterialApp(
      title: 'Moon Flutter',
      // 设置主题
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: MainPage(),
    );
  }
}

void main() {
//  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  runApp(HomePage());
}



