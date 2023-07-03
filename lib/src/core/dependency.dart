import 'package:ayat_nesia/src/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    Get.put<Dio>(Dio());
    Get.put<DioClient>(DioClient());
  }
}
