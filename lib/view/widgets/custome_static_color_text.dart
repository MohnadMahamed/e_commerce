import 'package:flutter/material.dart';

class CustomeStaticColorText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final double height;
  final int maxLines;

  const CustomeStaticColorText(
      {Key? key,
      this.color = Colors.black,
      required this.text,
      this.fontSize = 0,
      this.height = 1.1,
      this.maxLines = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines == 0 ? 2 : maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            height: height,
            fontWeight: FontWeight.bold,
            fontSize: fontSize == 0 ? 16 : fontSize,
            color: color == Colors.black ? Colors.black87 : color));
  }
}
