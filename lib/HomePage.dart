import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_first_demo/MyFavorite.dart';
import 'package:flutter_first_demo/utils/WidgetUtil.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // 抽屉
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('Moon'),
      accountEmail: new Text('moonljt521@gmail.com'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage('images/ic_launcher.png'), radius: 35.0,),);

    return new MaterialApp(
      title: 'Welcome to Flutter',
      // 设置主题
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('主页'),
        ),
        body: new Center(

//          child: new Text('Hello World'),
//          child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              userHeader , // 可在这里替换自定义的header
              ListTile(title: Text('计算器'),
                leading: new CircleAvatar(child: new Icon(Icons.computer),),
                onTap: () {
                    // 进入计算器
                    WidgetUtil.showSnackBar(context, "进入计算器");

                },),
              ListTile(title: Text('待开发功能1'),
                leading: new CircleAvatar(child: new Text('B2'),),
                onTap: () {
//                  Navigator.pop(context);
                },),
              ListTile(title: Text('待开发功能2'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.list),),
                onTap: () {
//                  Navigator.pop(context);
                },),
            ],
          ),
        ),

      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];

  // 存储收藏过的单词对 （set）
  final _saved = new Set<WordPair>();

  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    // 导航按钮 click
    _navigationMyFavouritePage(BuildContext mContext ,Set<WordPair> _saved) {

      Navigator.of(mContext).push(

        new MaterialPageRoute(
          builder: (mContext) {
            return new MyFavorite(
              title: "我的收藏",
              mSaved: _saved,
            );
          },
        ),
      );
    }

    void _pushMyFavourite(){

      if(_saved.isEmpty){
        WidgetUtil.showSnackBar(context, "您还没有收藏单词");
        return;
      }
        _navigationMyFavouritePage(context , _saved);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('单词列表'),

        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list)
              , onPressed: _pushMyFavourite
//              , onPressed: _pushSaved(context, _saved)

          )
        ],

      ),
      body: _buildSuggestions(),
    );
  }



  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  // ！！相当于 adapter ？？？？？
  Widget _buildRow(WordPair pair) {

    // 检测是否已经存储
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // 添加点击事件 ：  setState方法可以触发UI刷新
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
            WidgetUtil.showSnackBar(context , "您取消收藏了" + pair.toString());

          } else {
            _saved.add(pair);
            WidgetUtil.showSnackBar(context , "您收藏了" + pair.toString());
          }
        });
      },

    );
  }
}