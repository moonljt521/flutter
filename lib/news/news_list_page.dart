

import 'package:flutter/cupertino.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';

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
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i),

      );
  }

  buildItem(int i) {

  }

  getNewsList(){

    String url = Api.BaseUrl_news;
    url +=  widget.type+"/json";
    HttpUtil.get(url, (data){
       if(data != null){

       }

    });
  }


}