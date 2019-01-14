

import 'dart:async';

import 'package:flutter_first_demo/bloc/BlocProvider.dart';

class NewsProvider implements BlocBase {

  StreamController<List> _counterController = StreamController<List>();
  StreamSink<List> get _inAdd => _counterController.sink;
  Stream<List> get resultData => _counterController.stream;

  // 处理业务逻辑的stream
  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  // 构造器
  NewsProvider(){

    _actionController.stream
        .listen(_handleLogic);
  }

  void dispose(){
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data){

    _inAdd.add(data);
  }




}