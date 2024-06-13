import 'package:e_commerce/core/utils/langs/ar.dart';
import 'package:e_commerce/core/utils/langs/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
