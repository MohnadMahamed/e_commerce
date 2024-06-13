import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeController) => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Explore'.tr,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  height: 30,
                  width: 30,
                  themeController.isDark
                      ? 'assets/images/searchDark.png'
                      : 'assets/images/search.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Cart'.tr,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  height: 40,
                  width: 40,
                  themeController.isDark
                      ? 'assets/images/cartDark.png'
                      : 'assets/images/cart.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Account'.tr,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  height: 30,
                  width: 30,
                  themeController.isDark
                      ? 'assets/menue_icon/userDark.png'
                      : 'assets/menue_icon/user.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          elevation: 0.0,
          // selectedItemColor: Colors.black,
          // backgroundColor: Colors.grey.shade50,
        ),
      ),
    );
  }
}
