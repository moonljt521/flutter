
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_body.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_widget.dart';
import 'package:flutter_first_demo/utils/date_time_utils.dart';
import 'package:flutter_first_demo/widget/picker/datetime_picker_theme.dart';
import 'package:flutter_first_demo/widget/picker/flutter_datetime_picker.dart';
import 'package:flutter_first_demo/widget/picker/i18n_model.dart';

class BottomPicker extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BottomPicker> {

  String _currentGrade;
  String _currentGender;
  String _birthday;


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

             ListTile(
               title: Center(
                 child: Text("生日:${_birthday}"),
               ),
               onTap: (){


                 DatePicker.showDatePicker(context,
                     showTitleActions: true,
                     minTime: DateTime(1970, 1, 1),
                     maxTime: DateTime.now(),
                     theme: DatePickerTheme(
                         backgroundColor: Colors.white,
                         itemStyle: TextStyle(
                             color: Colors.black, fontWeight: FontWeight.bold),
                         doneStyle:
                         TextStyle(color: Colors.white, fontSize: 16)),
                     onChanged: (date) {

                       setState(() {
                         _birthday = DateTimeUtils.getFormat(date);

                       });

                     }, onConfirm: (date) {
                       print('confirm $date');

                     }, currentTime: DateTime.now(), locale: LocaleType.zh);



//                 CommonPicker.showDatePicker(context,  (data){
//
//                   print('您选择的生日是:${data}');
//                   setState(() {
//                     _birthday = data;
//                   });
//
//                 },locale : Locale('zh', 'CH'));



               },
             ),


          ],
        )
    );
  }




}