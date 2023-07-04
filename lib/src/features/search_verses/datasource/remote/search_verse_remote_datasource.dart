import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/api_base.dart';
import '../../../../core/network/api_config.dart';
import '../model/search_verse_result_model.dart';

class SearchVerseRemoteDataSource extends ApiBase<SearchVerseResultModel> {
  //Get surah list
  Future<Either<String, SearchVerseResultModel>> searchVerse({
    required String query,
    required String measureType,
    required String topRelevance,
  }) async {
    Future<Either<String, SearchVerseResultModel>> result =
        makeRequestForSingleObject(
      dioClient.dio.post(ApiConfig.searchVerses, queryParameters: {
        'query': query,
        'measure_type': measureType,
        'top_relevance': topRelevance
      }),
      SearchVerseResultModel.fromJson,
    );
    return result;
  }
}
