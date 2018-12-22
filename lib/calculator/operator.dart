import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef void PressOperationCallback(Operator oper);

abstract class Operator {
  String display;
  Color color;

  num calculate(num first, num second);
}

class AddOperator extends Operator {
  @override
  String get display => '+';

  @override
  Color get color => Colors.pink[300];

  @override
  calculate(first, second) {
    return first + second;
  }
}

class SubOperator extends Operator {
  @override
  String get display => '-';

  @override
  Color get color => Colors.orange[300];

  @override
  calculate(first, second) {
    return first - second;
  }
}

class MultiOperator extends Operator {
  @override
  String get display => 'x';

  @override
  Color get color => Colors.lightBlue[300];

  @override
  calculate(first, second) {
    return first * second;
  }
}

class DivisionOperator extends Operator {
  @override
  String get display => '÷';

  @override
  Color get color => Colors.purple[300];

  @override
  calculate(first, second) {
    if (second == 0) {
      return 0;
    }
    return first / second;
  }
}

class DelOperator extends Operator {
  @override
  String get display => 'del';

  @override
  Color get color => Colors.red[800];

  @override
  calculate(first, second) {
    return 0;
  }
}

class OperatorGroup extends StatelessWidget {

  OperatorGroup(this.onOperatorButtonPressed , currentDisplay);

  final PressOperationCallback onOperatorButtonPressed;
  String currentDisplay;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OperatorButton(
          oper: AddOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: SubOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: MultiOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: DivisionOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: DelOperator(),
          onPress: onOperatorButtonPressed,
        ),
      ],
    );
  }
}

class OperatorButton extends StatefulWidget {

  final Operator oper;
  final PressOperationCallback onPress;
  String showContent ; // 当前输入框内的文本

  OperatorButton({
    @required this.oper, this.onPress , this.showContent})
      : assert(Operator != null);


  @override
  State<StatefulWidget> createState() => OperatorButtonState();
}

/**
 * 绘制 加减乘除 按钮的 widget
 */
class OperatorButtonState extends State<OperatorButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                if (widget.onPress != null) {
                  widget.onPress(widget.oper);
                  setState(() {
                    pressed = true;
                  });
                  Future.delayed(
                      const Duration(milliseconds: 200),
                      () => setState(() {
                            pressed = false;
                          }));
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: pressed
                        ? Color.alphaBlend(Colors.white30, widget.oper.color)
                        : widget.oper.color,
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Text(
                  '${widget.oper.display}',
                  style: TextStyle( fontSize: widget.oper.display == "del" ? 22.0 : 30.0, color: Colors.white),
                ),
              ),
            )));
  }
}
