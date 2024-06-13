import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeListTile extends StatelessWidget {
  final String text;
  final String imagePath;
  final Widget? trailIconData;
  final void Function() onPressed;

  const CustomeListTile(
      {super.key,
      required this.text,
      required this.imagePath,
      this.trailIconData,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
      init: AppThemeViewModel(),
      builder: (themeController) => Column(
        children: [
          SizedBox(
            child: MaterialButton(
              onPressed: onPressed,
              child: ListTile(
                title: CustomText(
                  text: text,
                  fontSize: 18.0,
                ),
                leading: Image.asset(
                  imagePath,
                  height: 40.0,
                  width: 40.0,
                ),
                trailing: trailIconData ??
                    Icon(
                      Icons.navigate_next,
                      color: themeController.isDark
                          ? Colors.white70
                          : Colors.black,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
