
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

  /**
   * y异步模式
   */
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

  /**
   * 同步模式
   */
  Future<BaseResp<T>> getSync<T>(url, {params, options, cancelToken}) async {

    print('get请求启动! url： ${_dio.options.baseUrl}$url  , reqParams:$params' );

    int _code;
    String _msg;
    T _data;
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

        _code = 200;
        _msg = "";


        if(response.data is! Map){
           return new BaseResp(_code, _msg, response.data);
        }
        _data = response.data['data'];
        return new BaseResp(_code, _msg, _data);

      }else {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();

        return new Future.error(new DioError(
          response: response,
          message: errorMsg,
          type: DioErrorType.RESPONSE
        ));
      }

    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');

      return new Future.error(new DioError(
          response: response,
          message: e.message,
          type: DioErrorType.RESPONSE
      ));
    }
  }

  /**
   * 异步模式
   */
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

  Future<BaseResp<T>> postSync<T>(url ,{params, options, cancelToken }) async {
    print('post请求启动! url： ${_dio.options.baseUrl}, $url  , reqParams:$params' );

    Response response;
    int _code;
    String _msg;
    T _data;

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

        _data = response.data['data'];
        return new BaseResp(_code, _msg, _data);

      }else {
        String errorMsg = "网络请求错误,状态码:" + response.statusCode.toString();

        return new Future.error(new DioError(
            response: response,
            message: errorMsg,
            type: DioErrorType.RESPONSE
        ));
      }

    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');

      return new Future.error(new DioError(
          response: response,
          message: 'post请求取消! ' + e.message,
          type: DioErrorType.RESPONSE
      ));
    }
  }
}


class BaseResp<T> {
  int errorCode;
  String errorMsg;
  T data;

  BaseResp( this.errorCode, this.errorMsg, this.data);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$errorCode");
    sb.write(",\"msg\":\"$errorMsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
