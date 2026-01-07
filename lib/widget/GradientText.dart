import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? textAlign;

  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        text,
        textAlign: textAlign,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style!.copyWith(color: Colors.white),
      ),
    );
  }
}
