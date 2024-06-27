import 'package:e_commerce/core/service/database/dio_helper.dart';
import 'package:e_commerce/core/theme/dark_theme.dart';
import 'package:e_commerce/core/theme/light_theme.dart';
import 'package:e_commerce/core/utils/langs/translation.dart';
import 'package:e_commerce/core/view_model/app_language_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/helper/cache_helper.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await GetStorage.init();
  await DioHelper.initDio();
  // await FirebaseAppCheck.instance.activate();

  Get.put(CartViewModel());
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({
    Key? key,
    this.isDark,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguageViewModel>(
      init: AppLanguageViewModel(),
      builder: (lanController) => GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel()..changeAppTheme(fromShared: isDark),
        builder: (themeController) => GetMaterialApp(
          title: 'E-Commerce App',
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          // themeMode: ThemeMode.light,
          themeMode: themeController.isDark ? ThemeMode.dark : ThemeMode.light,
          translations: Translation(),
          locale: Locale(lanController.appLanguage),
          fallbackLocale: const Locale('en'),
          home: const ControlView(),
        ),
      ),
    );
  }
}
