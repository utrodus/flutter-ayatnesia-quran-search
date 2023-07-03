import 'package:dartz/dartz.dart';

import '../../../../core/network/api_base.dart';
import '../../../../core/network/api_config.dart';
import '../model/detail_surah_model.dart';

class DetailSurahRemoteDataSource extends ApiBase<DetailSurahModel> {
  //Get surah list
  Future<Either<String, DetailSurahModel>> getDetailSurah(num id) async {
    Future<Either<String, DetailSurahModel>> result =
        makeGetRequestForSingleObject(
      dioClient.dio.get("${ApiConfig.detailSurah}/$id"),
      DetailSurahModel.fromJson,
    );
    return result;
  }
}
