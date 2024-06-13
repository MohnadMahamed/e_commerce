import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/add_product_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

uploadImageFunction(
        {required AppThemeViewModel themeController,
        required BuildContext pageContext,
        required AddProductViewModel addController}) =>
    () {
      final AlertDialog alart = AlertDialog(
        scrollable: true,
        backgroundColor: themeController.isDark
            ? AppColors.darkBackGroundColor
            : AppColors.lighBackGroundColor,
        title: CustomText(
          text: 'Upload Image from ?'.tr,
        ),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.mainAppColors.withOpacity(.8)),
                  child: InkWell(
                      onTap: () async {
                        await addController.pickGalleryImage().then((value) {
                          Navigator.pop(pageContext);
                        });

                        //  controller.deleteProductById(model.productId!, model);
                        // showToast(
                        //     text: 'Task deleted successfully',
                        //     state: ToastStates.error);
                      },
                      child: Center(
                        child: CustomeStaticColorText(
                          text: 'Gallery'.tr,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: InkWell(
                      onTap: () async {
                        addController.pickCameraImage().then((value) {
                          Navigator.pop(pageContext);
                        });

                        // await cubit.pickCameraImage().then((value) {
                        //   Navigator.pop(context);
                        // });
                      },
                      child: Center(
                        child: CustomeStaticColorText(
                          color: Colors.white,
                          text: 'Camara'.tr,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      );
      showDialog(
          context: pageContext,
          barrierDismissible: true,
          builder: (ctx) {
            return alart;
          });
    };
