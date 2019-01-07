

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoundPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FoundPageState();
  }
}

class _FoundPageState extends State<FoundPage> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    new Tab(text: '语文'),
    new Tab(text: '数学'),
    new Tab(text: '英语'),
    new Tab(text: '化学'),
    new Tab(text: '物理'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
    new Tab(text: '体育'),
  ];


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
                  children: myTabs.map((Tab tab) {
                    return Center(child: new Text(tab.text));
                  }).toList(),
                ),
              )

            ],
          ),
        ),
      );


  }
  
}