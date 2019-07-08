
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cupertino_date_picker/locale_message.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_body.dart';
import 'package:flutter_first_demo/utils/date_format_base.dart';
import 'package:flutter_first_demo/utils/date_time_utils.dart';

const double _dialogHeight = 210;

class CommonPicker {

  static void showPicker(BuildContext context, List<PickerBody> data , Function checkListener){
    showModalBottomSheet(context: context, builder:(BuildContext context){
      return _ModalBottomSheetState(pickData: data,checkFunction: checkListener);
    });
  }


  static void showDatePicker(BuildContext context,Function checkListener ,{Locale locale}){
    showModalBottomSheet(context: context, builder:(BuildContext context){
      return _ModalBottomSheetDatePickerState(checkFunction: checkListener ,locale: locale,);
    });
  }
}

class _ModalBottomSheetState extends StatelessWidget {

  Function checkFunction;

  PickerBody checkPickBody;

  List<PickerBody> pickData;

  int _currentIndex = 0;

  _ModalBottomSheetState({this.pickData , this.checkFunction});

  @override
  Widget build(BuildContext context) {
    return  new GestureDetector(
      onTap: (){},
      child: Stack(
        children: <Widget>[
          Container(
            height: _dialogHeight,
            color: Colors.black54,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
            ),
            height: _dialogHeight,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
                          child: Text("取消",style: TextStyle(fontSize: 17,color: const Color(0xFF4A5060),decoration: TextDecoration.none),)
                      ),
                    ),

                    Expanded(child: Container(),flex: 1,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        checkFunction(pickData[_currentIndex]);
                      },
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
                          child: Text("确定",style: TextStyle(fontSize: 17,color: const Color(0xFFF95862),decoration: TextDecoration.none),)
                      ),
                    ),
                  ],
                ),

                Expanded(flex:1,
                    child:Container(
                      color: Colors.white,
                      child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          scrollController:FixedExtentScrollController(),
                          itemExtent: 36.0,
                          onSelectedItemChanged: (int index) {
                            _currentIndex = index;
                          },
                          children: pickData.map((checkData){
                            return Center(child: Text(checkData.value ,style: TextStyle(fontSize: 16,color: const Color(0xFF4A5060)),));
                          }).toList()
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );;
  }
}

class _ModalBottomSheetDatePickerState extends StatelessWidget {

  Function checkFunction;

  PickerBody checkPickBody;

  String currentDate;

  Locale locale;

  _ModalBottomSheetDatePickerState({ this.checkFunction ,this.locale});


   Widget _getDialog(BuildContext context){
     return Container(
        child: new GestureDetector(
          onTap: (){},
          child: Stack(
            children: <Widget>[
              Container(
                height: _dialogHeight,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                ),
                height: _dialogHeight,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
                              child: Text("取消",style: TextStyle(fontSize: 17,color: const Color(0xFF4A5060),decoration: TextDecoration.none),)
                          ),
                        ),

                        Expanded(child: Container(),flex: 1,),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            checkFunction(currentDate);
                          },
                          child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
                              child: Text("确定",style: TextStyle(fontSize: 17,color: const Color(0xFFF95862),decoration: TextDecoration.none),)
                          ),
                        ),
                      ],
                    ),

                    Expanded(flex:1,
                        child:Container(
                          color: Colors.white,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (DateTime selectDate){
                              print('>>>> $selectDate');
//                            currentDate = formatDate(selectDate , [yyyy,'-',MM,'-',dd]);
                              currentDate = DateTimeUtils.getFormat(selectDate);
                              //todo
                            },
                            use24hFormat: false,
                            initialDateTime: DateTime.now(),
                            minimumDate: DateTime.now().subtract(Duration(days: 30)),
                            maximumDate: new DateTime(2050,12,30),
                            minimumYear: 1950,
                            maximumYear: 2050,
                            minuteInterval: 1,
                            mode: CupertinoDatePickerMode.date,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        )
     );
   }


  @override
  Widget build(BuildContext context) {


    if (locale != null) {
      return Localizations.override(
        context: context,
        locale: locale,
        child: _getDialog(context),
      );
    }

    return
      _getDialog(context);
  }

}