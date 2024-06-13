import 'package:e_commerce/core/model/category_model.dart';
import 'package:e_commerce/core/model/product_model.dart';
import 'package:e_commerce/core/service/home_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        // print('catNum : ${_categoryModel.length}');
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        // print('catNum : ${_productModel.length}');
        _loading.value = false;
      }
      update();
    });
  }

  String categoryId = '';

  selectedCategoryId({required String categoryName}) {
    if (categoryName == 'Gadgets') {
      categoryId = '0luxU4KUoinNgo8BAIYN';
    } else if (categoryName == 'Men') {
      categoryId = 'NAr6ngsrmbQ3SMjQnYzf';
    } else if (categoryName == 'Gaming') {
      categoryId = '1LW2BIJakNdymFLJuOKV';
    } else if (categoryName == 'Women') {
      categoryId = 'MCc6DtlaBhxxKnAbH61X';
    } else if (categoryName == 'Devices') {
      categoryId = 'dKzRmWCI0cTBUQUdlD5I';
    }
    update();
  }
}
