import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_language_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/components/edit_profile/edit_profile.dart';
import 'package:e_commerce/view/widgets/custome_list_tile.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
      init: AppThemeViewModel(),
      builder: (themeController) => GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Scaffold(
                    body: Container(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100.0),
                                  image: DecorationImage(
                                    image: controller.userModel.pic!.isEmpty
                                        ? const AssetImage(
                                            'assets/images/facebook.png',
                                          )
                                        : controller.userModel.pic == 'default'
                                            ? const AssetImage(
                                                'assets/images/pic_profile.png')
                                            : NetworkImage(
                                                controller.userModel.pic!,
                                              ) as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: CustomText(
                                    text: controller.userModel.name!,
                                    color: Colors.black,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 220,
                                  child: CustomText(
                                    text: controller.userModel.email!,
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomeListTile(
                          text: 'Profile'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/userDark.png'
                              : 'assets/menue_icon/user.png',
                          onPressed: () {
                            Get.to(() => EditProfile());
                          }),

                      CustomeListTile(
                          text: 'Shopping Address'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/locationDark.png'
                              : 'assets/menue_icon/location.png',
                          onPressed: () {}),
                      CustomeListTile(
                          text: 'Order History'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/historyDark.png'
                              : 'assets/menue_icon/history.png',
                          onPressed: () {}),
                      CustomeListTile(
                          text: 'Card'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/cardDark.png'
                              : 'assets/menue_icon/card.png',
                          onPressed: () {}),
                      CustomeListTile(
                          text: 'Notification'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/notificationDark.png'
                              : 'assets/menue_icon/notification.png',
                          onPressed: () {}),
                      GetBuilder<AppThemeViewModel>(
                        init: Get.find<AppThemeViewModel>(),
                        builder: (themeController) => CustomeListTile(
                            text: 'Theme'.tr,
                            imagePath: themeController.isDark
                                ? 'assets/menue_icon/themeDark.png'
                                : 'assets/menue_icon/theme.png',
                            trailIconData: SizedBox(
                              width: 120,
                              child: DropdownButton(
                                elevation: 0,
                                underline: const SizedBox(),
                                dropdownColor: themeController.isDark
                                    ? Colors.black
                                    : Colors.white,
                                focusColor: AppColors.mainAppColors,
                                isExpanded: true,
                                alignment: AlignmentDirectional.centerStart,
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: themeController.isDark
                                      ? Colors.white70
                                      : Colors.black,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'dark',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: 'Dark'.tr,
                                        ),
                                        Icon(
                                          Icons.navigate_next,
                                          color: themeController.isDark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'light',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: 'Light'.tr,
                                        ),
                                        Icon(
                                          Icons.navigate_next,
                                          color: themeController.isDark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                // value: controller.appLanguage,
                                onChanged: (value) {
                                  themeController.chooseAppTheme(
                                      fromShared: value!);

                                  // Get.updateLocale(Locale(value));
                                },
                              ),
                            ),
                            onPressed: () {}),
                      ),

                      GetBuilder<AppLanguageViewModel>(
                        init: Get.find<AppLanguageViewModel>(),
                        builder: (controller) => CustomeListTile(
                            text: 'Language'.tr,
                            imagePath: themeController.isDark
                                ? 'assets/menue_icon/languageDark.png'
                                : 'assets/menue_icon/language.png',
                            trailIconData: SizedBox(
                              width: 120,
                              child: DropdownButton(
                                elevation: 0,
                                underline: const SizedBox(),
                                dropdownColor: themeController.isDark
                                    ? Colors.black
                                    : Colors.white,
                                focusColor: AppColors.mainAppColors,
                                isExpanded: true,
                                alignment: AlignmentDirectional.centerStart,
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: themeController.isDark
                                      ? Colors.white70
                                      : Colors.black,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'en',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomText(
                                          text: 'English',
                                        ),
                                        Icon(
                                          Icons.navigate_next,
                                          color: themeController.isDark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'ar',
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomText(
                                          text: 'العربية',
                                        ),
                                        Icon(
                                          Icons.navigate_next,
                                          color: themeController.isDark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                // value: controller.appLanguage,
                                onChanged: (value) {
                                  controller.chooseLanguage(value!);

                                  Get.updateLocale(Locale(value));
                                },
                              ),
                            ),
                            onPressed: () {}),
                      ),
                      CustomeListTile(
                          text: 'Log Out'.tr,
                          imagePath: themeController.isDark
                              ? 'assets/menue_icon/logoutDark.png'
                              : 'assets/menue_icon/logout.png',
                          onPressed: () {
                            controller.signOut();

                            Get.offAll(() => LoginScreen());
                          }),
                      const SizedBox(
                        height: 10.0,
                      ),

                      // const SizedBox(
                      //   height: 30.0,
                      // ),
                    ],
                  )),
                )),
              ),
      ),
    );
  }
}
