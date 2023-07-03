import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'api_config.dart';
import 'dio_interceptor.dart';

//singleton class for DioClient
class DioClient {
  static final DioClient _instance = DioClient._internal();
  Dio dio = Get.find<Dio>();

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        headers: ApiConfig.header,
        connectTimeout: ApiConfig.connectionTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        responseType: ResponseType.json,
      ),
    )..interceptors.add(DioInterceptor());
  }
}
