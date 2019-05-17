

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTouch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTouchState();
  }
}


class _MyTouchState extends State<MyTouch> {

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移


  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Scaffold(
        body: Container(
          child:  GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails details){

              setState(() {

                double changeW = 200 * details.scale.clamp(.5, 6);
                double dW = changeW - _width;
                print("changeW = ${changeW} , dw = ${dW}");
                _width = changeW;
              });
            },

            child: Container(
              width: _width,
              height: _width,
              margin: EdgeInsets.only(
                  top: _top,
                  left: _left
              ),
              child: GestureDetector(
                child: Text("AAAA"),
                onPanDown: (DragDownDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  //用户手指滑动时，更新偏移，重新构建
                  if(_left + e.delta.dx < 0) {
                    _left - e.delta.dx;
                    return;
                  }

                  if( _top + e.delta.dy < 0){
                    _top - e.delta.dy ;
                    return;
                  }

                  if(e.delta.dx > 0 &&  _screenWidth - _left < _width){
                    return;
                  }


                  setState(() {
                    _left += e.delta.dx;
                    _top += e.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails e){
                  //打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },

              ),
              alignment: Alignment.center,
              color: Colors.green,
            ),

          ),
        ),
      ),
    );
  }

}

