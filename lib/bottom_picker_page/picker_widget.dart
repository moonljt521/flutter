
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_first_demo/bottom_picker_page/picker_body.dart';
import 'package:flutter_first_demo/utils/date_time_utils.dart';

const double _dialogHeight = 210;

class CommonPicker {

  static void showPicker(BuildContext context, List<PickerBody> data , Function checkListener){
    showModalBottomSheet(context: context, builder:(BuildContext context){
      return _ModalBottomSheet(pickData: data,checkFunction: checkListener);
    });
  }


  static void showDatePicker(BuildContext context,Function checkListener ,{Locale? locale}){
    showModalBottomSheet(context: context, builder:(BuildContext context){
      return _ModalBottomSheetDatePicker(checkFunction: checkListener ,locale: locale,);
    });
  }
}

class _ModalBottomSheet extends StatefulWidget {
  final List<PickerBody> pickData;
  final Function checkFunction;

  const _ModalBottomSheet({Key? key, required this.pickData, required this.checkFunction}) : super(key: key);

  @override
  State<_ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<_ModalBottomSheet> {

  int _currentIndex = 0;

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
                        widget.checkFunction(widget.pickData[_currentIndex]);
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
                          children: widget.pickData.map((checkData){
                            return Center(child: Text(checkData.value ,style: TextStyle(fontSize: 16,color: const Color(0xFF4A5060)),));
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
}

class _ModalBottomSheetDatePicker extends StatefulWidget {
  final Function checkFunction;
  final Locale? locale;

  const _ModalBottomSheetDatePicker({Key? key, required this.checkFunction, this.locale}) : super(key: key);

  @override
  State<_ModalBottomSheetDatePicker> createState() => _ModalBottomSheetDatePickerState();
}

class _ModalBottomSheetDatePickerState extends State<_ModalBottomSheetDatePicker> {

  String currentDate = "";

  @override
    void initState() {
      super.initState();
      currentDate = DateTimeUtils.getFormat(DateTime.now());
    }

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
                            widget.checkFunction(currentDate);
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


    if (widget.locale != null) {
      return Localizations.override(
        context: context,
        locale: widget.locale,
        child: _getDialog(context),
      );
    }

    return
      _getDialog(context);
  }

}