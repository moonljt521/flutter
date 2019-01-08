

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/news/item_news_page.dart';

class NewsListPage extends StatefulWidget {

  String type;

  NewsListPage({
    Key key,
    @required this.type
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return NewsListState();
  }
}


class NewsListState extends State<NewsListPage> {

  List listData = List();

  @override
  void initState() {
    super.initState();
    getNewsList();
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
      );
  }

  Widget buildItem(int i) {
    if(i.isOdd){
      return Divider(height: 1.0);
    }else {
      i = i ~/ 2;
      var newsData = listData[i];
      return ItemNewsWidget(itemData: newsData);
    }
  }

  getNewsList(){

    String url = Api.BaseUrl_news ;
    url += "?type=" + widget.type + "&key=" + HttpUtil.NEWS_KEY;

    HttpUtil.get(url, HttpUtil.SOURCE_JUHE ,(data){
       if(data != null){
         setState(() {
           listData = data;
         });
       }
    });
  }


}