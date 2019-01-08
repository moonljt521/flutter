

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

class _FoundPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {

  final List<NewsTabLayout> myTabs = <NewsTabLayout>[
    NewsTabLayout(type: 'top',content: '头条'),
    NewsTabLayout(type: 'shehui',content: '社会'),
    NewsTabLayout(type: 'guonei',content: '国内'),
    NewsTabLayout(type: 'guoji',content: '国际'),
    NewsTabLayout(type: 'yule',content: '娱乐'),
    NewsTabLayout(type: 'tiyu',content: '体育'),
    NewsTabLayout(type: 'junshi',content: '军事'),
    NewsTabLayout(type: 'keji',content: '科技'),
    NewsTabLayout(type: 'caijing',content: '财经'),
    NewsTabLayout(type: 'shishang',content: '时尚'),

  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

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
                isScrollable: true,
              ),

              Expanded(
                flex: 1,
                child: TabBarView(
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