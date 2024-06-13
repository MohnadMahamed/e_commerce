import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_language_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/components/edit_profile/profile_bottom_sheet.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
      init: AppThemeViewModel(),
      builder: (appThemeController) => SafeArea(
          child: Scaffold(
              key: _scaffoldKey,
              body: GetBuilder<ProfileViewModel>(
                  init: ProfileViewModel(),
                  builder: (controller) => Column(children: [
                        const SizedBox(height: 10.0),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, right: 20, left: 20.0, bottom: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        // const HomeScreen()));
                                        // Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 30.0,
                                        color: appThemeController.isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        _scaffoldKey.currentState!
                                            .showBottomSheet(
                                                enableDrag: true,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: AppColors
                                                          .mainAppColors
                                                          .withOpacity(.4),
                                                      width: 1),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40)),
                                                ),
                                                backgroundColor:
                                                    appThemeController.isDark
                                                        ? AppColors
                                                            .darkBackGroundColor
                                                        : AppColors
                                                            .lighBackGroundColor,
                                                // context: context,
                                                (context) {
                                          return const EditProfileBottomSheetWidget();
                                        });
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 30.0,
                                        color: appThemeController.isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      )),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 47.0,
                              child: Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(100.0),
                                    image: DecorationImage(
                                      image: controller.userModel.pic!.isEmpty
                                          ? const AssetImage(
                                              'assets/images/facebook.png',
                                            )
                                          : controller.userModel.pic ==
                                                  'default'
                                              ? const AssetImage(
                                                  'assets/images/pic_profile.png')
                                              : NetworkImage(
                                                  controller.userModel.pic!,
                                                ) as ImageProvider,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: '${'Name'.tr} : ',
                                    fontSize: 18.0,
                                  ),
                                  SizedBox(
                                    width: 235,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: AppColors.mainAppColors
                                            .withOpacity(0.5),
                                        border: Border.all(
                                            color: AppColors.mainAppColors),
                                      ),
                                      child: Center(
                                        child: CustomeStaticColorText(
                                          text: controller.userModel.name!,
                                          fontSize: 20.0,
                                          color: appThemeController.isDark
                                              ? Colors.white70
                                              : Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GetBuilder<AppLanguageViewModel>(
                              builder: (appLanguageController) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: '${'Email'.tr} : ',
                                      fontSize: 18.0,
                                    ),
                                    SizedBox(
                                      width:
                                          appLanguageController.appLanguage ==
                                                  'en'
                                              ? 250
                                              : 170,
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppColors.mainAppColors
                                              .withOpacity(0.5),
                                          border: Border.all(
                                              color: AppColors.mainAppColors),
                                        ),
                                        child: Center(
                                          child: CustomeStaticColorText(
                                            text: controller.userModel.email!,
                                            fontSize: 20.0,
                                            color: appThemeController.isDark
                                                ? Colors.white70
                                                : Colors.black45,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ])))),
    );
  }
}
