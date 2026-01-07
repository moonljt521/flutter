
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/home/ArticleItem.dart';
import 'package:flutter_first_demo/constant/Constants.dart';
import 'package:flutter_first_demo/request/request_manager.dart';
import 'package:flutter_first_demo/request/request_util.dart';
import 'package:flutter_first_demo/utils/Toast.dart';
import 'package:flutter_first_demo/widget/EndLine.dart';
import 'package:flutter_first_demo/widget/SlideView.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List listData = [];
  var bannerData;
  var curPage = 0;
  var listTotalSize = 0;

  var isLoading = false;
  var pullIsLoading = false;

  ScrollController _controller = ScrollController();
  TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  TextStyle subtitleTextStyle =
  TextStyle(color: Colors.blue, fontSize: 12.0);

  _HomePageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && listData.length < listTotalSize) {
        getHomeArticlelist();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
    getHomeArticlelist();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Future<Null> _pullToRefresh() async{
    setState(() {
      isLoading = true;
    });

    curPage = 0;
    getBanner();
    getHomeArticlelist();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (listData.isEmpty && isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Widget listView = ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i),
        controller: _controller,
      );

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Expanded(
            child: RefreshIndicator(
                child: listView,
                onRefresh: _pullToRefresh),
            flex: 1,
          ),

          isLoading ? LinearProgressIndicator() : Container(child: Divider(height: 1,),height: 1,)
    ],
      ) ;

    }
  }

  SlideView? _bannerView;

  void getBanner() async{

    BaseResp<List> resp = await RequestManager.getWanAndroidBannerSync();

    
      setState(() {
        bannerData = resp.data;
        if(bannerData != null) {
          _bannerView = SlideView(bannerData);
        }
      });
    

  }

  void getHomeArticlelist() async{

    setState(() {
      isLoading = true;
    });

    BaseResp<Map<String, dynamic>> resp = await RequestManager.getWanAndroidMainPageSync<Map<String,dynamic>>("$curPage");
    
    if (resp.errorCode == 0 && resp.data != null) {

      var _listData = resp.data!['datas'] ;

      listTotalSize = resp.data!['total'];

      setState(() {
        isLoading = false;

        var list1 = [];
        if (curPage == 0) {
          listData.clear();
        }
        curPage++;

        list1.addAll(listData);
        list1.addAll(_listData);
        if (list1.length >= listTotalSize) {
          list1.add(Constants.END_LINE_TAG);
        }

        listData = list1;
      });
    }else{
      Toast.toast(resp.errorMsg);
      setState(() {
        isLoading = false;
      });
    }

  }

  Widget buildItem(int i) {
    if (i == 0) {
      return Container(
        height: 180.0,
        child: _bannerView ?? Container(),
      );
    }
    i -= 1;

    if (i >= listData.length) {
       return Container();
    }

    var itemData = listData[i];

//    new WandroidBean

    if (itemData is String && itemData == Constants.END_LINE_TAG) {
      return EndLine();
    }

    return ArticleItem(itemData);
  }
  
}