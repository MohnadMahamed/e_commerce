import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
        }
        break;
      case 1:
        {
          _currentScreen = const CartView();
        }
        break;
      case 2:
        {
          _currentScreen = const ProfileView();
        }
        break;
    }

    update();
  }
}
