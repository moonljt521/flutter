import 'package:flutter/material.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/utils/DataUtils.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
import 'package:flutter_first_demo/webview_container/webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_first_demo/widget/GradientText.dart';

///个人感觉条目比较复杂的话可以单独拿出来,而且可以复用.可以对比CollectListPage.dart中的item哪个更合理
class ArticleItem extends StatefulWidget {
  final dynamic itemData;

  //是否来自搜索列表
  final bool isSearch;
  //搜索列表的id
  final String? id;

  const ArticleItem(this.itemData, {Key? key})
      : isSearch = false,
        id = null,
        super(key: key);

  //命名构造函数,搜索列表的item和普通的item有些不一样
  const ArticleItem.isFromSearch(this.itemData, this.id, {Key? key})
      : isSearch = true,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ArticleItemState();
  }
}

class ArticleItemState extends State<ArticleItem> {
  void _handleOnItemCollect(itemData) {
    DataUtils.isLogin().then((isLogin) {
      if (!isLogin) {
        _login();
      } else {
        _itemCollect(itemData);
      }
    });
  }

  _login() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  void _itemClick(itemData) async {

    RouterUtil.routeAnimation(context, WebViewPage(
      itemData['title'],
      itemData['link'],
    ));
  }

  //收藏/取消收藏
  void _itemCollect(var itemData) {
    String url;
    if (itemData['collect']) {
      url = Api.UNCOLLECT_ORIGINID;
    } else {
      url = Api.COLLECT;
    }
    url += '${itemData["id"]}/json';
    HttpUtil.post(url, HttpUtil.SOURCE_HONGYUANG, (data) {
      setState(() {
        itemData['collect'] = !itemData['collect'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCollect = widget.itemData["collect"];

    Row row1 = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Text('作者:  '),
            Text(
              widget.itemData['author'],
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        )),
        Text(widget.itemData['niceDate'])
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child:
            GradientText(
                widget.itemData['title'],
               style: TextStyle(fontSize: 28.sp,),
               gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepOrange, Colors.pink , Colors.black12 ,Colors.lightGreenAccent]),
                textAlign: TextAlign.left,
            ),


        )
      ],
    );

    Row chapterName = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            widget.isSearch ? '' : widget.itemData['chapterName'],
            softWrap: true,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.left,
          ),
        ),
        GestureDetector(
          child: Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? Colors.red : null,
          ),
          onTap: () {
            _handleOnItemCollect(widget.itemData);
          },
        )
      ],
    );

    Column column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: row1,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: chapterName,
        ),
      ],
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        child: column,
        onTap: () {
          _itemClick(widget.itemData);
        },
      ),
    );
  }
}
