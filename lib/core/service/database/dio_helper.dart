import 'package:dio/dio.dart';
import 'package:e_commerce/core/constance.dart';

class DioHelper {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return dio.post(
      url,
      data: data,
    );
  }
}
