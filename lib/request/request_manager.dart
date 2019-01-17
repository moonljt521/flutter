


import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/request/request_util.dart';

class RequestManager {


  static getWanAndroidMainPage(String page ,Function callBack , {Function errorCallBack}){
    HttpUtil.instance.get(Api.ARTICLE_LIST + page + "/json", callBack ,errorCallBack: errorCallBack);
  }

  static Future<BaseResp<T>> getWanAndroidMainPageSync<T>(String page) async{
    return await HttpUtil.instance.getSync(Api.ARTICLE_LIST + page + "/json");
  }

  static getWanAndroidBanner(Function callBack , {Function errorCallBack}){
    HttpUtil.instance.get(Api.BANNER, callBack ,errorCallBack: errorCallBack);
  }

  static Future<BaseResp<T>> getWanAndroidBannerSync<T>() async{
    return await HttpUtil.instance.getSync(Api.BANNER);
  }

}