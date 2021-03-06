import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/MyFavorite.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
import 'package:flutter_first_demo/utils/Toast.dart';

/**
 *  单词表页面
 */
class ReciteWords extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<ReciteWords> {

  final _suggestions = <WordPair>[];

  // 存储收藏过的单词对 （set）
  final _saved = Set<WordPair>();

  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    // 导航按钮 click
    _navigationMyFavouritePage(BuildContext mContext ,Set<WordPair> _saved) {

      RouterUtil.route(context, MyFavorite(
        title: "我的收藏",
        mSaved: _saved,
      ));

    }

    return Scaffold(
      appBar: AppBar(
        title: Text('单词列表'),

        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list)
              , onPressed:(){
                if(_saved.isEmpty){

                  Toast.toast("您还没有收藏单词");

                  return;
                }
                _navigationMyFavouritePage(context , _saved);
          }

          )
        ],

      ),
      body: _buildSuggestions(),
    );
  }



  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

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

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      // 添加点击事件 ：  setState方法可以触发UI刷新
      onTap: () {
        setState(() {

          if (alreadySaved) {
            _saved.remove(pair);
            Toast.toast("您取消收藏了" + pair.toString());

          } else {
            _saved.add(pair);
            Toast.toast("您收藏了" + pair.toString());
          }
        });
      },

    );
  }
}