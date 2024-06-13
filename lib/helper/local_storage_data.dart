import 'dart:convert';

import 'package:e_commerce/core/constance.dart';
import 'package:e_commerce/core/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      // if (userModel == null) {
      //   return UserModel();
      // }
      return userModel;
    } catch (e) {
      debugPrint(e.toString());
      return UserModel();
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(cachedUserData);
    return UserModel.fromJson(jsonDecode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cachedUserData, jsonEncode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
