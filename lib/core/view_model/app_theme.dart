import 'package:e_commerce/helper/cache_helper.dart';
import 'package:get/get.dart';

class AppThemeViewModel extends GetxController {
  bool isDark = true;
  // @override
  // void onInit() async {
  //   super.onInit();
  //   isDark = await CacheHelper.getData(key: 'isDark');
  //   changeAppTheme(fromShared: isDark);
  //   update();
  // }

  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      update();
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        update();
      });
    }
  }

  void chooseAppTheme({String? fromShared}) {
    if (fromShared != null) {
      if (fromShared == 'dark') {
        isDark = true;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          update();
        });
      } else if (fromShared == 'light') {
        isDark = false;
        CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
          update();
        });
      }
    }
  }
}
