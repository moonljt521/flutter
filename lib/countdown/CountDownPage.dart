import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_first_demo/countdown/progress.dart';
import 'package:flutter_first_demo/login/LoginPage.dart';
import 'package:flutter_first_demo/utils/RouterUtil.dart';

class CountDownPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountDownState();
  }
}

class CountDownState extends State<CountDownPage> implements OnSkipClickListener{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      onSkipClick();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Image.network(
            "",
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(),
        ),
        Image.asset(
          '../../sampleimages/1.jpg',
          fit: BoxFit.fitWidth,
        ),
        Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0),
              child: SkipDownTimeProgress(
                  Colors.red,
                    22.0,
                    Duration(seconds: 5),
                    Size(25.0, 25.0),
                    skipText: "跳过",
                    clickListener: this,
    )

              ),
            ),
          ),
      ],
    );

  }

  @override
  void onSkipClick() {
    print("onSkipClick.....");
    Navigator.of(context).pop();
    RouterUtil.routeAnimation(context, LoginPage());
  }

}
