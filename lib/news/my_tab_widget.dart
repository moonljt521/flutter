
import 'package:flutter/cupertino.dart';

class NewsTabLayout extends StatelessWidget{

  String content;

  String type;

  NewsTabLayout({
     @required this.type,
     @required this.content
  }):super();

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 10),
        child: Text(content , style: TextStyle(
          fontSize: 14,
        ),),
      );
  }
}