import 'package:flutter/material.dart';

// const primaryColor = Color.fromRGBO(0, 197, 105, 1);

const String tableCartProduct = 'cartProduct';
const String columnName = 'name';
const String columnImage = 'image';
const String columnQuantity = 'quantity';
const String columnPrice = 'price';
const String columnProductId = 'productId';
const String columnStatus = 'status';

const cachedUserData = 'CACHED_USER_DATA';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

class ApiConstants {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RneU1EWTVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuVTRYZFM5WWFPaDVsbXg1VnM4NDJvMGNKYk9xZVJKR2RibFZIQ2J5aXRTblhTa3NBUnVqaFBJaU9USzVTV0dDQlQ2VTdjUVpSU1MtVkVxUUUybEpnRnc=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/852598?payment_token=$finalToken';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';
  static String finalToken = '';
  static const String integrationIdCard = '4598518';
  static const String integrationIdKiosk = '4598852';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
