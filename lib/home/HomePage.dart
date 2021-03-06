
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_demo/home/ArticleItem.dart';
import 'package:flutter_first_demo/constant/Constants.dart';
import 'package:flutter_first_demo/home/wandroid_body.dart';
import 'package:flutter_first_demo/http/Api.dart';
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
  List listData = List();
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
    if (listData == null) {
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

  SlideView _bannerView;

  void getBanner() async{

    BaseResp<List> resp = await RequestManager.getWanAndroidBannerSync();

    if (resp != null) {
      setState(() {
        bannerData = resp.data;
        _bannerView = SlideView(bannerData);
      });
    }


//    await RequestManager.getWanAndroidBanner( (data){
//      if (data != null) {
//        setState(() {
//          bannerData = data;
//          _bannerView = SlideView(bannerData);
//        });
//      }
//    } , errorCallBack: (error){
//       Toast.toast(error);
//    });
  }

  void getHomeArticlelist() async{

    setState(() {
      isLoading = true;
    });

    BaseResp<Map<String, dynamic>> resp = await RequestManager.getWanAndroidMainPageSync<Map<String,dynamic>>("$curPage");
    if (resp != null) {

      var _listData = resp.data['datas'] ;

      listTotalSize = resp.data['total'];

      setState(() {
        isLoading = false;

        var list1 = List();
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
    }


//    RequestManager.getWanAndroidMainPage( "$curPage" ,(data){
//      if (data != null) {
//
//        Map<String, dynamic> map = data;
//
//        var _listData = map['datas'];
//
//        listTotalSize = map["total"];
//
//        setState(() {
//          isLoading = false;
//
//          var list1 = List();
//          if (curPage == 0) {
//            listData.clear();
//          }
//          curPage++;
//
//          list1.addAll(listData);
//          list1.addAll(_listData);
//          if (list1.length >= listTotalSize) {
//            list1.add(Constants.END_LINE_TAG);
//          }
//          listData = list1;
//        });
//      }
//    } , errorCallBack: (error){
//      Toast.toast(error);
//    });




  }

  Widget buildItem(int i) {
    if (i == 0) {
      return Container(
        height: 180.0,
        child: _bannerView,
      );
    }
    i -= 1;

    var itemData = listData[i];

//    new WandroidBean

    if (itemData is String && itemData == Constants.END_LINE_TAG) {
      return EndLine();
    }

    return ArticleItem(itemData);
  }
  
}