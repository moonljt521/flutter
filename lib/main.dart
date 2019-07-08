import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_demo/main_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) => {});

    return MaterialApp(
//      localizationsDelegates: [
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      supportedLocales: [
//        //此处
//        const Locale('zh', 'CH'),
//        const Locale('en', 'US'),
//      ],

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
