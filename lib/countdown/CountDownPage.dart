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
//            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547453837&di=7437232d0e17299aae81db64787a984b&imgtype=jpg&er=1&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201812%2F10%2F231855basa2bkay3yv3jsg.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3430517011,2018229434&fm=26&gp=0.jpg',
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(),
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
    Navigator.of(context).pop();
  }

}
