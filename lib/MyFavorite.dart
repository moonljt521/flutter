import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  initState(){
    // 此方法不执行 ？？？？？
    print("initState.........");
  }

  @override
  State<StatefulWidget> createState() {
    return new MyFavoriteState();
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
        return new ListTile(
            title: new Text(
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

    return new Scaffold(

      appBar: new AppBar(
        title: new Text('我的收藏'),
      ),
      body: new ListView(children: divided),
    );
  }


  // 展示一个页面
  void _showWelcomePage(BuildContext context ,String content) {

    Navigator.of(context).push(

      new MaterialPageRoute(

        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'WELCOME YOU~~~',
                textAlign: TextAlign.center,),
            ),
            body: new Text(
              content,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: new TextStyle(color: Colors.red,fontSize: 60 , fontWeight: FontWeight.normal
                  ,background: new Paint()),),
          );

        },
      ),
    );
  }

}