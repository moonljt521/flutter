

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/home/articel_detail_page.dart';

class MinePage extends StatefulWidget {




  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  
  @override
  Widget build(BuildContext context) {
    return
      Card(
          elevation: 4,
          child: InkWell(
              onTap: (){
//                RouterUtil.routeAnimation(context, ArticleDetaiPage(
//                  title: widget.itemData['title'],
//                  url: widget.itemData['url'],
//                ));

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
                          child: Text("111111可勾缝剂哦覅11噢诶偶尔偶尔偶尔哦哦覅噢诶偶尔偶尔偶尔哦" , style: TextStyle(fontSize: 12),),
                        ),
                      ),

                      Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3430517011,2018229434&fm=26&gp=0.jpg",width: 100,)
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child:Text("["+ "十分饿" + "]" + "2019-09-01"),
                  ),

                ],

              )
          )
      );
  }
  
}