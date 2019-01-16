
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_first_demo/http/Api.dart';
import 'package:flutter_first_demo/http/HttpUtil.dart';

class HttpUtil {

  Dio _dio;

  factory HttpUtil() => _getInstance();
  static HttpUtil get instance => _getInstance();
  static HttpUtil _instance;

  HttpUtil._internal(){
    _dio = new Dio();
    _dio.options
      ..baseUrl = Api.BaseUrl
      ..connectTimeout = 10000
      ..receiveTimeout = 3000;
  }

  static HttpUtil _getInstance() {
    print('getInstance');
    if (_instance == null) {
      _instance = new HttpUtil._internal();
    }
    return _instance;
  }

  get(url, Function callBack , {params, options, cancelToken , Function errorCallBack}) async {
    print('get请求启动! url： ${_dio.options.baseUrl}$url  , reqParams:$params' );

    Response response;

    if (params != null && params.isNotEmpty) {
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    try {
      response = await _dio.get(
        url,
        cancelToken: cancelToken,
      );

      if(response.statusCode == 200){
        print('get请求成功!response.data：${response.data}');
        if(callBack != null){
          callBack(response.data['data']);
        }
      }else {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        if(errorCallBack != null){
          errorCallBack(errorMsg);
        }
      }

    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
      if(errorCallBack != null){
        errorCallBack(e.message);
      }
    }
  }


  post(url,  Function callBack ,{params, options, cancelToken }) async {
    print('post请求启动! url： ${_dio.options.baseUrl}, $url  , reqParams:$params' );

    Response response;
    ErrorBody errorBody;

    if (params != null && params.isNotEmpty) {
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    try {
      response = await _dio.post(
        options.baseUrl +  url,
        data: params,
        cancelToken: cancelToken,
      );

      if(response.statusCode == 200){

        Map<String, dynamic> map = json.decode(response.data);
        print('post请求成功!response.data：${response.data}');
        var respData = map['data'];
        return respData;
      }else {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();
        errorBody = ErrorBody();
        errorBody.errorMsg = errorMsg;
        return errorBody;
      }

    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
        errorBody = ErrorBody();
        errorBody.errorMsg = e.message;
      }
      print('post请求发生错误：$e');
      return errorBody;
    }
  }

  static void _handError(Function errorCallback,String errorMsg){
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
  }


}