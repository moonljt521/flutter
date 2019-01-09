import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/news/NewsPage.dart';
import 'package:flutter_first_demo/home/HomePage.dart';
import 'package:flutter_first_demo/MinePage.dart';
import 'package:flutter_first_demo/MyDrawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainPage> {

  int _tabIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  var appBarTitles = ['首页', '新闻', '我的'];

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[ HomePage(), NewsPage(), MinePage()],
      index: _tabIndex,
    );

//    var x = (-10) % 3;
//    print(x);
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: Text(appBarTitles[0]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: Text(appBarTitles[1]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: Text(appBarTitles[2]),
        backgroundColor: Colors.blue,
      ),
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    initData();

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_tabIndex]),
      ),
      body: _body,
      drawer: MyDrawer(),

      bottomNavigationBar: BottomNavigationBar(
        items: _navigationViews
            .map((BottomNavigationBarItem navigationView) => navigationView)
            .toList(),
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }


}
