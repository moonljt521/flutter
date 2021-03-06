

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';
import 'package:flutter_first_demo/utils/Toast.dart';
import 'package:flutter_first_demo/webview_container/webview_page.dart';

class ItemNewsWidget extends StatefulWidget {

  var itemData;

  ItemNewsWidget({
      Key key,
      @required this.itemData
  }):super(key:key);


  @override
  State<StatefulWidget> createState() {
    return ItemNewsState();
  }
}

class ItemNewsState extends State<ItemNewsWidget> {
  @override
  Widget build(BuildContext context) {

    return Card(
        elevation: 4,
        child: InkWell(
            onTap: (){
              RouterUtil.routeAnimation(context, WebViewPage(
                 widget.itemData['title'],
                widget.itemData['url'],
              ));

            },
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(10, 20, 20, 20),
                        padding: EdgeInsets.all(5),
                        child: Text(widget.itemData['title'] , style: TextStyle(fontSize: 12),),
                      ),
                    ),

                    Image.network(widget.itemData['thumbnail_pic_s'],width: 100,)
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  child:Text("["+ widget.itemData['author_name'] + "]" + widget.itemData['date']),
                ),
              ],

            )
        )
    );
  }
}