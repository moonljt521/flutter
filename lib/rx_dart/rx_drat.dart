

import 'package:flutter/cupertino.dart';
import 'package:flutter_first_demo/base/base_toolbar_widget.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemoWidget extends BaseStatefulWidget{


 @override
  void initState() {
    super.initState();
  }

  @override
  String getTitle() {
    return "rxDart";
  }

  @override
  Widget getWidget(BuildContext context) {
    _rxDart();

    return Text("");
  }

  _rxDart(){

    var subject = new BehaviorSubject<String>();
    subject.listen((item) => print("1->"+item));

    subject.add("Item1");
    subject.add("Item2");

    subject.listen((item) => print("2->"+item.toUpperCase()));

    subject.add("Item3");
    /**
     * 打印结果是
     * I/flutter (19347): 1->Item1
        I/flutter (19347): 2->ITEM2
        I/flutter (19347): 2->ITEM3
        I/flutter (19347): 1->Item2
        I/flutter (19347): 1->Item3
        监听2 会打印 item2 ，是因为 rx 会缓存一个数据
     *
     *
     */


  }
  
  
  _print(var data){
     print(data);
  }

}