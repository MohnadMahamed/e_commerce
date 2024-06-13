import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? textColor;
  final Color? color;
  final bool isLoading;
  final double? width;
  final double? height;

  const CustomeButton(
      {super.key,
      this.width = 0,
      this.height = 0,
      required this.text,
      this.isLoading = false,
      required this.onPressed,
      this.textColor = Colors.white,
      this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width == 0 ? double.infinity : width,
      // height: height == 0 ? 60 : height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding:
          isLoading ? const EdgeInsets.all(10) : const EdgeInsets.all(18.0),
      onPressed: onPressed,
      color: color ?? AppColors.mainAppColors,
      child: isLoading
          ? const CircularProgressIndicator()
          : CustomeStaticColorText(
              text: text,
              color: textColor!,
            ),
    );
  }
}
