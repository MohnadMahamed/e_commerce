import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadProfileImageDialog extends StatelessWidget {
  final BuildContext pageContext;
  final ProfileViewModel controller;

  const UploadProfileImageDialog(
      {super.key, required this.pageContext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
      init: AppThemeViewModel(),
      builder: (appThemeController) => IconButton(
          onPressed: () {
            final AlertDialog alart = AlertDialog(
              scrollable: true,
              backgroundColor: appThemeController.isDark
                  ? AppColors.darkBackGroundColor
                  : AppColors.lighBackGroundColor,
              title: CustomText(
                text: 'Upload Image from ?'.tr,
              ),
              content: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
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
                              await controller.pickGalleryImage().then((value) {
                                Navigator.pop(context);
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
                              await controller.pickCameraImage().then((value) {
                                Navigator.pop(context);
                              });
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
          },
          icon: const CircleAvatar(
            radius: 22.0,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 20.0,
            ),
          )),
    );
  }
}
