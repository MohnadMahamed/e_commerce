import 'package:e_commerce/core/constance.dart';
import 'package:e_commerce/core/service/database/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentViewModel extends GetxController {
  PaymentViewModel() {
    getAuthToken();
  }
  Future<void> getAuthToken() async {
    update();
    DioHelper.postData(url: ApiConstants.getAuthToken, data: {
      "api_key": ApiConstants.paymentApiKey,
    }).then((onValue) {
      ApiConstants.paymentFirstToken = onValue.data['token'];
      update();
      print('TOOOOOOOOOOOOOOOOOOKEN DONEEE ${ApiConstants.paymentFirstToken}');
    }).catchError((onError) {
      print(onError.toString());
      update();
    });
  }

  Future<void> getOrderReqisterationId(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price}) async {
    update();
    DioHelper.postData(url: ApiConstants.getOrderId, data: {
      "auth_token": ApiConstants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((onValue) {
      print('TAMAAAAAAAAAAAAAAAMAMAMAMMAAMAMAMMAMAM YASTAAAAAAAAAAAAAAA');

      ApiConstants.paymentOrderId = onValue.data['id'].toString();
      getPaymentRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          price: price);
      update();
    }).catchError((onError) {
      print('feeeeeeeeeeeeeeeeeeeeeeeeeeee MOshhhhhhhhhhhhhkallaaaa');
      print(onError.toString());
      update();
    });
  }

  bool getPaymentRequestSucess = false;

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  Future<void> getPaymentRequest(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price}) async {
    update();
    // loading.value = false;
    DioHelper.postData(url: ApiConstants.getPaymentRequest, data: {
      "auth_token": ApiConstants.paymentFirstToken,
      "amount_cents": price,
      "currency": "EGP",
      "expiration": 3600,
      "order_id": ApiConstants.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName
      },
      "lock_order_when_paid": "false",
      "integration_id": ApiConstants.integrationIdCard
    }).then((onValue) {
      print('LLLLLLLLLLLLLLAHHHHHHHHHHHHHHHOHOHOHOHHOH');

      // getPaymentRequestSucess = true;
      _loading.value = true;
      update();
      ApiConstants.finalToken = onValue.data['token'];
      print(ApiConstants.finalToken);
    }).catchError((onError) {
      print(onError.toString());
      print('YAAAAAAAAAAAAAAAAAAAAAAAAAADASADDADAAD');
      update();
    });
  }

  bool getRefCodeSucess = false;
  bool getRefCodeFail = false;
  Future<void> getRefCode() async {
    update();
    DioHelper.postData(url: ApiConstants.getRefCode, data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR",
      },
      "payment_token": ApiConstants.finalToken,
    }).then((onValue) {
      ApiConstants.refCode = onValue.data['id'].toString();
      getRefCodeSucess = true;
      update();
    }).catchError((onError) {
      getRefCodeFail = true;

      print(onError.toString());
      update();
    });
  }
}
