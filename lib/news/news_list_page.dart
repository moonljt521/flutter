import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/bloc/BlocProvider.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/news/item_news_view.dart';
import 'package:flutter_first_demo/news/news_list_provider.dart';

class NewsListPage extends StatelessWidget {

  String type;

  NewsListPage({
    Key key,
    @required this.type
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsProvider>(
      child: NewsListState(type: type,),
      bloc: NewsProvider(),
    );;
  }
}

class NewsListState extends StatelessWidget{

  String type;

  NewsListState({
    Key key,
    @required this.type
  }):super(key:key);


  NewsProvider bloc;

  @override
  Widget build(BuildContext context) {

    print("build................>>>>>>");
    bloc = BlocProvider.of<NewsProvider>(context);

    getNewsList();

    return
      StreamBuilder<List>(  // 监听Stream，每次值改变的时候，更新Text中的内容
        stream: bloc.resultData,
        initialData: List(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          return
            ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) => buildPage(snapshot.data,i),
            );
        }
    );
  }

  Widget buildPage(var data , var i){
    if(i.isOdd){
      return Divider(height: 1.0);
    }else {
      i = i ~/ 2;
      return ItemNewsWidget(itemData: data[i]);
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
    url += "?type=" + type + "&key=" + HttpUtil.NEWS_KEY;

    HttpUtil.get(url, HttpUtil.SOURCE_JUHE ,(data){
       if(data != null){

         bloc.incrementCounter.add(data);

       }
    });
  }

  @override
  bool get wantKeepAlive => true;


}