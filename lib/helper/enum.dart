import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum Delivery {
  standardDelivery,
  nextDayDelivery,
  nominatedDelivery,
}

String chooseDeliveryKind(Delivery delivery) {
  String delviveryKind;
  switch (delivery) {
    case Delivery.standardDelivery:
      delviveryKind = 'Standard Delivery'.tr;
      break;
    case Delivery.nextDayDelivery:
      delviveryKind = 'Next Day Delivery'.tr;
      break;
    case Delivery.nominatedDelivery:
      delviveryKind = 'Nominated Delivery'.tr;
      break;
  }
  return delviveryKind;
}

String pageCheckOutName(int index) {
  String? pageName;
  switch (index) {
    case 0:
      pageName = 'Delivery Time'.tr;
      break;
    case 1:
      pageName = 'Choose Address'.tr;
      break;
    case 2:
      pageName = 'Summary'.tr;
      break;
  }
  return pageName!;
}

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 15.0,
    );

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.mainAppColors;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.teal;
      break;
  }
  return color;
}
