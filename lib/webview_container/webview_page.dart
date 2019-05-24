

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {

  String _url;

  String _title;

  WebViewPage(String title, String url){
    this._url = url;
    this._title = title;
  }

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title),),
      body: WebviewScaffold(
        url: widget._url,
      ),
    );
  }

}