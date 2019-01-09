import 'package:flutter/material.dart';
import 'package:flutter_first_demo/home/articel_detail_page.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/utils/DataUtils.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
import 'package:flutter_first_demo/utils/StringUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


///个人感觉条目比较复杂的话可以单独拿出来,而且可以复用.可以对比CollectListPage.dart中的item哪个更合理
class ArticleItem extends StatefulWidget {
  var itemData;

  //是否来自搜索列表
  bool isSearch;
  //搜索列表的id
  String id;

  ArticleItem(var itemData){
    this.itemData = itemData;
    this.isSearch =false;
  }

  //命名构造函数,搜索列表的item和普通的item有些不一样
  ArticleItem.isFromSearch(var itemData, String id) {
    this.itemData = itemData;
    this.isSearch = true;
    this.id = id;
  }

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

    RouterUtil.routeAnimation(context, ArticleDetaiPage(
      title: itemData['title'],
      url: itemData['link'],
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
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
        Text(widget.itemData['niceDate'])
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
            widget.isSearch
                ? StringUtils.getTextSpan(widget.itemData['title'], widget.id)
                : TextSpan(text: widget.itemData['title']),
            softWrap: true,
            style: TextStyle(fontSize: ScreenUtil().setSp(28,false), color: Colors.black),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );

    Row chapterName = Row(
//      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Text(
            widget.isSearch ? '' : widget.itemData['chapterName'],
            softWrap: true,
            style: TextStyle(color: Theme.of(context).accentColor),
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
