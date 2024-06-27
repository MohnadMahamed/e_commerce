import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
  final String text;
  final String imagePath;
  final Widget? trailIconData;
  final void Function() onPressed;
  final AppThemeViewModel themeController;

  const CustomeListTile(
      {super.key,
      required this.text,
      required this.imagePath,
      this.trailIconData,
      required this.onPressed,
      required this.themeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: MaterialButton(
            onPressed: onPressed,
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                    fontSize: 18.0,
                    color:
                        themeController.isDark ? Colors.white : Colors.black),
              ),
              leading: Image.asset(
                imagePath,
                height: 40.0,
                width: 40.0,
              ),
              trailing: trailIconData ??
                  Icon(
                    size: 30,
                    Icons.navigate_next,
                    color:
                        themeController.isDark ? Colors.white70 : Colors.black,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
