import 'package:e_commerce/core/model/cart_product_model.dart';
import 'package:e_commerce/core/service/database/cart_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  deleteProductById(String id, CartProductModel product) async {
    _loading.value = true;
    await dbHelper.deleteProduct(id: id);
    cartProductModel.remove(product);
    _totalPrice -= (double.parse(product.price!) * product.quantity!);

    // await dbHelper.getAllProduct();
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
      debugPrint(_totalPrice.toString());
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;
    _totalPrice -= (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
