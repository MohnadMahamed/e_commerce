import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/add_product_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class PickColorWidget extends StatelessWidget {
  const PickColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      init: AddProductViewModel(),
      builder: (addController) => GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeController) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomText(
                      text: 'color'.tr,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: themeController.isDark
                                  ? AppColors.darkBackGroundColor
                                  : AppColors.lighBackGroundColor,
                              title: CustomText(
                                text: 'Pick Your Color'.tr,
                                fontSize: 20.0,
                              ),
                              content: Container(
                                height: MediaQuery.of(context).size.height * .5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ColorPicker(
                                        pickerColor: addController.color,
                                        onColorChanged: (color) =>
                                            addController.changColor(color),
                                      ),
                                      CustomeButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          print(addController.color);
                                        },
                                        text: 'SELECT'.tr,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 65.0,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColors.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        width: 0.0,
                        color: AppColors.mainAppColors.withOpacity(0.5),
                      ),
                    ),
                    child: Container(
                      width: 30.0,
                      height: 20.0,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.0,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        color: addController.color,
                      ),
                    ),
                  )

                  // Container(
                  //   width: 20,
                  //   height: 20,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: addController.color,
                  //   ),
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
