import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>" + widget.url);

    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: isLoad
                ? LinearProgressIndicator()
                : Divider(
                    height: 1.0,
                    color: Theme.of(context).primaryColor,
                  )),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
