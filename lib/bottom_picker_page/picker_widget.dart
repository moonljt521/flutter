
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_first_demo/bottom_picker_page/picker_body.dart';

const double _dialogHeight = 210;

class CommonPicker {

  static void showPicker(BuildContext context, List<PickerBody> data , Function checkListener){
    showModalBottomSheet(context: context, builder:(BuildContext context){
      return _ModalBottomSheetState(pickData: data,checkFunction: checkListener);
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
                          padding: EdgeInsets.only(left: 20,top: 15,bottom: 15),
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

