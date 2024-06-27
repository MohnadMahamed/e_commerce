import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double height;
  final Color color;
  final int maxLines;
  const CustomText(
      {super.key,
      this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.maxLines = 1,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines == 1 ? 1 : maxLines,
      style: TextStyle(
          // fontFamily: 'SourceSans',
          height: height,
          fontWeight: FontWeight.bold,
          fontSize: fontSize),
    );
  }
}
