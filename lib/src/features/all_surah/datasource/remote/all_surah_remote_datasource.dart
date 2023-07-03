import 'package:dartz/dartz.dart';

import '../../../../core/network/api_base.dart';
import '../../../../core/network/api_config.dart';
import '../model/all_surah_model.dart';

class AllSurahRemoteDataSource extends ApiBase<AllSurahModel> {
  //Get surah list
  Future<Either<String, List<AllSurahModel>>> getUserList() async {
    Future<Either<String, List<AllSurahModel>>> result = makeGetRequestForList(
      dioClient.dio.get(ApiConfig.allSurah),
      AllSurahModel.fromJson,
    );
    return result;
  }
}
