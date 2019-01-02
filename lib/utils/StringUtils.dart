import 'package:flutter/widgets.dart';
import 'package:flutter_first_demo/constant/colors.dart';

class StringUtils {
  // 保存用户登录信息，data中包含了token等信息
  static TextSpan getTextSpan(String text, String key) {
    if (text == null || key == null) {
      return null;
    }

    if (text == null || key == null) {
      return null;
    }

    String splitString1 = "<em class='highlight'>";
    String splitString2 = "</em>";

    String textOrigin =
        text.replaceAll(splitString1, '').replaceAll(splitString2, '');

    TextSpan textSpan = TextSpan(
        text: key, style: TextStyle(color: AppColors.colorPrimary));

    List<String> split = textOrigin.split(key);

    List<TextSpan> list = List<TextSpan>();

    for (int i = 0; i < split.length; i++) {
      list.add(TextSpan(text: split[i]));
      list.add(textSpan);
    }

    list.removeAt(list.length - 1);

    return TextSpan(children: list);
  }
}
