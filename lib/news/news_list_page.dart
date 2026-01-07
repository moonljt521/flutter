
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/bloc/BlocProvider.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/news/item_news_view.dart';
import 'package:flutter_first_demo/news/news_list_provider.dart';

class NewsListPage extends StatelessWidget {

  final String type;

  NewsListPage({
    Key? key,
    required this.type
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsProvider>(
      child: NewsListWidget(type: type,),
      bloc: NewsProvider(),
    );
  }
}

class NewsListWidget extends StatefulWidget {
  final String type;

  const NewsListWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<NewsListWidget> createState() => NewsListState();
}

class NewsListState extends State<NewsListWidget>{

  late NewsProvider bloc;

  @override
  void initState() {
    super.initState();
    // In initState, context might not be ready for inherited widget lookup if we use it directly?
    // Actually BlocProvider.of(context) works if it's up the tree.
    // However, build is safer for context access usually, but for one-time fetch initState is better.
    // But BlocProvider logic depends on build context.
    // We'll call getNewsList in build or didChangeDependencies.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<NewsProvider>(context);
    getNewsList();
  }

  @override
  Widget build(BuildContext context) {

    return
      StreamBuilder<List>(  // 监听Stream，每次值改变的时候，更新Text中的内容
        stream: bloc.resultData,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
          }
          return
            ListView.builder(
              itemCount: snapshot.data!.length,
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

  getNewsList(){

    String url = Api.BaseUrl_news ;
    url += "?type=" + widget.type + "&key=" + HttpUtil.NEWS_KEY;

    HttpUtil.get(url, HttpUtil.SOURCE_JUHE ,(data){
       if(data != null){

         bloc.incrementCounter.add(data);

       }
    });
  }
}