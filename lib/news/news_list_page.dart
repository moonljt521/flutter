

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


class NewsListState extends State<NewsListPage> with AutomaticKeepAliveClientMixin{

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


  /**
   *  json示例
   * {
      "reason": "成功的返回",
      "result": {
      "stat": "1",
      "data": [
      {
      "uniquekey": "6c4caa0c3ba6e05e2a272892af43c00e",
      "title": "杨幂的发际线再也回不去了么？网友吐槽像半秃",
      "date": "2017-01-05 11:03",
      "category": "yule",
      "author_name": "腾讯娱乐",
      "url": "http://mini.eastday.com/mobile/170105110355287.html?qid=juheshuju",
      "thumbnail_pic_s": "http://03.imgmini.eastday.com/mobile/20170105/20170105110355_
      806f4ed3fe71d04fa452783d6736a02b_1_mwpm_03200403.jpeg",
      "thumbnail_pic_s02": "http://03.imgmini.eastday.com/mobile/20170105/20170105110355_
      806f4ed3fe71d04fa452783d6736a02b_2_mwpm_03200403.jpeg",
      "thumbnail_pic_s03": "http://03.imgmini.eastday.com/mobile/20170105/20170105110355_
      806f4ed3fe71d04fa452783d6736a02b_3_mwpm_03200403.jpeg"
      },
      ...]}}
   *
   */

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

  @override
  bool get wantKeepAlive => true;


}