

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/news/my_tab_widget.dart';
import 'package:flutter_first_demo/news/news_list_page.dart';

class NewsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FoundPageState();
  }
}

class _FoundPageState extends State<NewsPage> with SingleTickerProviderStateMixin {

  final List<NewsTabLayout> myTabs = <NewsTabLayout>[
    new NewsTabLayout(type: 'top',content: '头条'),
    new NewsTabLayout(type: 'shehui',content: '社会'),
    new NewsTabLayout(type: 'guonei',content: '国内'),
    new NewsTabLayout(type: 'guoji',content: '国际'),
    new NewsTabLayout(type: 'yule',content: '娱乐'),
    new NewsTabLayout(type: 'tiyu',content: '体育'),
    new NewsTabLayout(type: 'junshi',content: '军事'),
    new NewsTabLayout(type: 'keji',content: '科技'),
    new NewsTabLayout(type: 'caijing',content: '财经'),
    new NewsTabLayout(type: 'shishang',content: '时尚'),

  ];


  TabController _tabController ;
  
  @override
  void initState() {
    super.initState();
//    todo
    _tabController = TabController(length: myTabs.length, vsync: ScrollableState());

  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: DefaultTabController(
          length: myTabs.length,
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorPadding: EdgeInsets.only(top: 4),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.blueGrey,
                tabs: myTabs,
                controller: _tabController,
                isScrollable: true,
              ),

              Expanded(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: myTabs.map((NewsTabLayout tab) {
                    return NewsListPage(type:tab.type);
                  }).toList(),
                ),
              )

            ],
          ),
        ),
      );
  }
  
}