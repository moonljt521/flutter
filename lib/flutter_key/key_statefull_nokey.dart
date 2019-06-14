

import 'package:flutter/material.dart';
import 'package:flutter_first_demo/flutter_key/StatefulColorfulTile.dart';

class StateFullNoKey extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _State1();
  }
}

 class _State1 extends State<StateFullNoKey> {

   List<Widget> widgets;

   @override
   void initState() {
     super.initState();
     widgets = [
       StatefulColorfulTile(),
       StatefulColorfulTile()
     ];
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("statefulWidget 无key"),),
       body: Row(
         children: widgets,
       ),

       floatingActionButton: FloatingActionButton(onPressed: (){
         setState(() {
           widgets.insert(1, widgets.removeAt(0));
         });
       } ),
     );
   }

 }