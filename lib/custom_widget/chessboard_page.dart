import 'package:flutter/material.dart';
import 'dart:math';

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("棋盘"),),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300), //指定画布大小
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );


    // ***********************************

    // 画白子 : 位于第一个格子
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(eWidth, eHeight),
        eHeight / 2 -2 ,
        paint);

    // 画黑子 : 位于第二行 第四个格子
    paint.color = Colors.black;
    canvas.drawCircle(
        Offset(eWidth * 4, eHeight * 2),
        eHeight / 2 -2 ,
        paint);

    // 画黑子 : 第三排，3-10个格子
    for (int i = 4 ;i < 8 ;i++){
      canvas.drawCircle(
          Offset(eWidth * i, eHeight * 3),
          eHeight / 2 -2 ,
          paint);
    }

    // 画白子 : 第5排，2-10个格子
    paint.color = Colors.white;
    for (int i = 7 ;i < 9 ;i++){
      canvas.drawCircle(
          Offset(eWidth * i, eHeight * 5),
          eHeight / 2 -2 ,
          paint);
    }

    // 画白子 : 第8 - 10 排，2-4个格子
    paint.color = Colors.black;
    for (int i = 8 ;i < 11 ;i++){
      for (int j = 2; j< 5 ;j++){
        if(i == 9 && j == 3){
          paint.color = Colors.white;
        }else{
          paint.color = Colors.black;
        }
        canvas.drawCircle(
            Offset(eWidth * j, eHeight * i),
            eHeight / 2 -2 ,
            paint);
      }
    }
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}