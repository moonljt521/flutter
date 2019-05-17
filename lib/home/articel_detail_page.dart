import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleDetaiPage extends StatefulWidget {
  String title;
  String url;

  ArticleDetaiPage({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArticleState();
  }
}

class _ArticleState extends State<ArticleDetaiPage> {
  bool isLoad = true;

//  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>"+widget.url);
    return Text("d");
  }
}
