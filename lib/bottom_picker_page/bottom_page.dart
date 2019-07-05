
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

  String _currentGrade;
  String _currentGender;


  List<PickerBody> _gradeList = [

    PickerBody(0,"一年级"),
    PickerBody(1,"二年级"),
    PickerBody(2,"三年级"),
    PickerBody(3,"四年级"),
    PickerBody(4,"五年级"),
  ];


  List<PickerBody> sexList = [

    PickerBody(0,"男"),
    PickerBody(1,"女"),

  ];

  @override
  Widget build(BuildContext context) {
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
                 CommonPicker.showPicker(context, _gradeList, (data){

                   print('您选择的年级是:${data.value}');
                   setState(() {
                     _currentGrade = data.value;
                   });

                 });
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




}