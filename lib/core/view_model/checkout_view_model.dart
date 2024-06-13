import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/checkout/add_address_widget.dart';
import 'package:e_commerce/view/checkout/delivery_time_widget.dart';
import 'package:e_commerce/view/checkout/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;
  int upperBound = 2;

  String? street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  Delivery delivery = Delivery.standardDelivery;

  incrementIndex() {
    _index++;
    update();
  }

  decrementIndex() {
    _index--;
    update();
  }

  Widget currentScreen = const DeliveryTime();

  Widget currentPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        {
          currentScreen = const DeliveryTime();
        }
        break;
      case 1:
        {
          currentScreen = const AddAddress();
        }
        break;
      case 2:
        {
          currentScreen = const Summary();
        }
        break;
    }
    // update();
    return currentScreen;
  }

  void goodBye() {
    _index = 0;
    update();
  }
}
