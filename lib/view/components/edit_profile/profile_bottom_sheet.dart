import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/components/edit_profile/upload_profile_image.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileBottomSheetWidget extends StatelessWidget {
  const EditProfileBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (appThemeController) => SafeArea(
              child: GetBuilder<ProfileViewModel>(
                init: ProfileViewModel(),
                builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width * .9,

                      color: appThemeController.isDark
                          ? AppColors.darkBackGroundColor
                          : AppColors.lighBackGroundColor,

                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 15),
                        child: Column(
                          children: [
                            // const SizedBox(height: 10.0),

                            Icon(
                              Icons.linear_scale_sharp,
                              size: 30.0,
                              color: appThemeController.isDark
                                  ? Colors.white70
                                  : Colors.black45,
                            ),
                            const SizedBox(height: 10.0),

                            Stack(
                              children: [
                                CircleAvatar(
                                  // backgroundImage: FileImage(

                                  //     AuthCubit.get(context)

                                  //         .file! as File),

                                  radius: 42,

                                  child: Container(
                                    height: 80.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        image: DecorationImage(
                                          image: controller.file != null
                                              ? FileImage(controller.imageFile!)
                                              : controller
                                                      .userModel.pic!.isEmpty
                                                  ? const AssetImage(
                                                      'assets/images/facebook.png',
                                                    )
                                                  : controller.userModel.pic ==
                                                          'default'
                                                      ? const AssetImage(
                                                          'assets/images/pic_profile.png')
                                                      : NetworkImage(
                                                          controller
                                                              .userModel.pic!,
                                                        ) as ImageProvider,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                                Positioned(
                                  right: -10,
                                  bottom: -10,
                                  child: UploadProfileImageDialog(
                                    pageContext: context,
                                    controller: controller,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            CustomeFormField(
                                controller: controller.updateNameController,
                                hintText: controller.userModel.name!,
                                type: TextInputType.name,
                                validator: (value) {
                                  return '';
                                },
                                text: 'Name'.tr),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomeFormField(
                                controller: controller.updateEmailController,
                                hintText: controller.userModel.email!,
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  return '';
                                },
                                text: 'Email'.tr),

                            const SizedBox(
                              height: 20.0,
                            ),
                            CustomeButton(
                                isLoading: controller.isLoading,
                                color: controller.isLoading
                                    ? AppColors.mainAppColors.withOpacity(.4)
                                    : AppColors.mainAppColors,
                                text: 'Update'.tr,
                                onPressed: () {
                                  controller.updateUserData().then((onValue) {
                                    Navigator.pop(context);
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
