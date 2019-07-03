

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/widget/imageloader.dart';

class CachedNetWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }

}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(title ?? "基于三方封装一个glide"),
      ),
      body: _testContent(),
    );
  }

  _testContent() {
    return new SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("1 自定义GlideWidget组件： 圆角imageView"),
            GlideWidget(
              width: 100.0,
              height: 100.0,
              radius: 36,
              clipOval:false,
              placeIcon: "images/avatar_default_icon.webp",
              errorIcon: "images/avatar_default_icon.webp",
//              imageUrl: "https://static.17xueba.com/test/server/image/2019/06/20190619203453658306.jpg",
              imageUrl: "https://static.17xueba.com/test/server/image/2019/06/20190614172810443568.jpg",
            ),


            Text("2 自定义GlideWidget组件： 圆形imageView"),
            GlideWidget(
              width: 100.0,
              height: 100.0,
              clipOval: true,
              placeIcon: "images/avatar_default_icon.webp",
              errorIcon: "images/avatar_default_icon.webp",
//              imageUrl: "https://static.17xueba.com/test/server/image/2019/06/20190619203453658306.jpg",
              imageUrl: "https://static.17xueba.com/test/server/image/2019/06/20190613143657379734.jpg",
            ),

            Text("3 Container 实现圆形"),
            new Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image:  new CachedNetworkImageProvider(
                      "https://static.17xueba.com/test/server/image/2019/06/20190614172810443568.jpg"),
                ),
              ),
            ),

            Text("4 ClipOval 实现圆形"),

            ClipOval(
                child:  new CachedNetworkImage(
                  width: 200,
                  height: 200,
                  fit: BoxFit.fitWidth,
                  placeholder: (context , url) => Image.asset(
                    "images/avatar_default_icon.webp",
                  ),
                  imageUrl: "https://static.17xueba.com/test/server/image/2019/06/20190619203453658306.jpg",
                )
            ),

            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "http://notAvalid.uri",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "not a uri at all",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x200",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fadeOutDuration: new Duration(seconds: 1),
                fadeInDuration: new Duration(seconds: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _gridView() {
    return new GridView.builder(
        itemCount: 250,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new CachedNetworkImage(
            imageUrl:
            "http://via.placeholder.com/${(index + 1)}x${(index % 100 + 1)}",
            placeholder: _loader,
            errorWidget: _error,
          );
        });
  }

  Widget _loader(BuildContext context, String url) {
    return new Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context, String url, Exception error) {
    print(error);
    return new Center(
      child: Icon(Icons.error),
    );
  }

  Widget _sizedContainer(Widget child) {
    return new SizedBox(
      width: 300.0,
      height: 300.0,
      child: child,
    );
  }


}