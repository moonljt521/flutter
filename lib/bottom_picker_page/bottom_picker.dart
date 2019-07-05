
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_body.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_widget.dart';

class BottomPicker extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BottomPicker> {

  FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {

    _currentGrade = _datas[_currentIndex];

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('自定义波轮菜单'),
        ),
        body: ListView(
          children: <Widget>[
             ListTile(
               title: Center(
                 child: Text("年级: ${_currentGrade}"),
               ),
               onTap: (){
                 _showAgeDialog(context);
               },
             ),
             Divider(),
             ListTile(
               title: Center(
                 child: Text("性别:${_currentGender}"),
               ),
               onTap: (){
                 CommonPicker.showPicker(context, sexList, (data){

                   print('您选择的性别是:${data.value}');
                   setState(() {
                     _currentGender = data.value;
                   });

                 });
               },
             ),
             Divider(),

          ],
        )
    );
  }

  int _currentIndex = 0;

  String _currentGrade;
  String _currentGender;

  List<String> _datas = [
   "一年级",
   "二年级",
   "三年级",
   "四年级",
   "五年级",
   "六年级",
   "七年级",
   "八年级",
  ];


  List<PickerBody> sexList = [
    PickerBody(0,"男"),
    PickerBody(1,"女"),

  ];

  _showAgeDialog(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return
          new GestureDetector(
          onTap: (){},
          child: Stack(
            children: <Widget>[
              Container(
                height: 210,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                ),
                height: 210,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 20,top: 15,bottom: 15),
                              child: Text("取消",style: TextStyle(fontSize: 17,color: const Color(0xFF4A5060)),)
                          ),
                        ),

                        Expanded(child: Container(),flex: 1,),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            //todo
                            setState(() {
                              _currentGrade = _datas[_currentIndex];
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
                              child: Text("确定",style: TextStyle(fontSize: 17,color: const Color(0xFFF95862)),)
                          ),
                        ),
                      ],
                    ),

                    Expanded(flex:1,
                        child:Container(
                          color: Colors.white,
                          child: CupertinoPicker(
                              backgroundColor: Colors.white,
                              scrollController:fixedExtentScrollController,
                              itemExtent: 36.0,
                              onSelectedItemChanged: (int index) {
                                  _currentIndex = index;
                                },
                              children: _datas.map((value){
                                return Center(child: Text(value ,style: TextStyle(fontSize: 16),),);
                              }).toList()
                          ),
                        ))
                  ],

                ),
              )

            ],
          ),
        );
      }
    );

  }

  _showGender(){

  }



}