


import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/request/request_util.dart';

class RequestManager {

  static RequestManager instance;


  static RequestManager getInstance() {
    if (instance == null) {
      instance = new RequestManager();
    }
    return instance;
  }

  getWanAndroidMainPage(String page ,Function callBack , {Function errorCallBack}){
    HttpUtil.getInstance().get(Api.ARTICLE_LIST + page + "/json", callBack ,errorCallBack: errorCallBack);
  }


  getWanAndroidBanner(Function callBack , {Function errorCallBack}){
    HttpUtil.getInstance().get(Api.BANNER, callBack ,errorCallBack: errorCallBack);
  }

}