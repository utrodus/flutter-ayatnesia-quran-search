import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'dio_client.dart';
import 'dio_exception.dart';

abstract class ApiBase<T> {
  //dioClient will be used in child classes
  DioClient dioClient = DioClient();

  //Generic Method template for getting data from server
  Future<Either<String, List<T>>> makeRequestForList(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;

      final List<T> dataList = List<T>.from(
        json.decode(json.encode(response.data)).map(
              (item) => getJsonCallback(item),
            ),
      );
      return right(dataList);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }

  Future<Either<String, T>> makeRequestForSingleObject(
      Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    try {
      final Response response = await apiCallback;

      final T data = getJsonCallback(json.decode(json.encode(response.data)));
      return right(data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }
}
