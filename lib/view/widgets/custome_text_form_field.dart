import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final void Function(String?)? onSave;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputType? type;
  final int? maxLines;
  final bool enabled;

  const CustomeFormField(
      {super.key,
      this.text = '',
      this.hintText = '',
      this.controller,
      this.onSave,
      this.maxLines,
      required this.validator,
      this.enabled = true,
      this.type});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
      init: AppThemeViewModel(),
      builder: (themeController) => Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(
                  text: text,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
            enabled: enabled,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color:
                    themeController.isDark ? Colors.white70 : Colors.black54),
            onSaved: onSave,
            controller: controller,
            keyboardType: type,
            maxLines: maxLines ?? 1,
            validator: (T) => validator(T),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color:
                      themeController.isDark ? Colors.white70 : Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              filled: true,
              fillColor: AppColors.mainAppColors.withOpacity(0.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(width: 0.0, color: Colors.transparent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
