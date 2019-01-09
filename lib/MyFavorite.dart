import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';

class MyFavorite extends StatefulWidget {

  String title;
  Set<WordPair> mSaved;

  BuildContext mContext ;

  MyFavorite({
     Key key,
     @required this.title,
     @required this.mSaved,
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return MyFavoriteState();
  }
}


class MyFavoriteState extends State<MyFavorite> {

  void _itemClick(String content){

     _showWelcomePage(context,content);
  }

  @override
  Widget build(BuildContext context) {

    final tiles = widget.mSaved.map(
          (pair) {
        return ListTile(
            title: Text(
              pair.asPascalCase,
            ),
            onTap:(){
              _itemClick(pair.asPascalCase);
            },
            onLongPress:() {

            },
        );
      },
    );

    final divided = ListTile
        .divideTiles(
        context: context,
        tiles: tiles,
        color: Colors.yellow // 间隔线颜色
    ).toList();

    return Scaffold(

      appBar: AppBar(
        title: Text('我的收藏'),
      ),
      body: ListView(children: divided),
    );
  }


  // 展示一个页面
  void _showWelcomePage(BuildContext context ,String content) {

    RouterUtil.route(context, Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME YOU~~~',
          textAlign: TextAlign.center,),
      ),
      body: Text(
        content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.red,fontSize: 60 , fontWeight: FontWeight.normal
            ,background: Paint()),),
    ));
  }

}