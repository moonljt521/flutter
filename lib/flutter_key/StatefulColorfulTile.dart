import 'package:flutter/material.dart';
import 'package:flutter_first_demo/flutter_key/UniqueColorGenerator.dart';

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);

  @override
  StatefulColorfulTileState createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  final Color defaultColor = UniqueColorGenerator().getColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        color: defaultColor,
      ),
    );
  }
}