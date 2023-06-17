import 'package:ayat_nesia/app/data/local/quran_local_data_source.dart';
import 'package:ayat_nesia/app/data/models/quran_model.dart';
import 'package:ayat_nesia/app/data/repository/quran_repository.dart';
import 'package:ayat_nesia/app/utils/app_response.dart';

import '../../utils/logging.dart';

class QuranRepositoryImpl extends QuranRepository {
  final String _prefix = "QuranRepositoryImpl";
  final QuranLocalDataSource quranLocalDataSource;
  QuranRepositoryImpl({required this.quranLocalDataSource});

  @override
  Future<AppResponse<List<QuranModel>>> getQuranData() async {
    try {
      var jsonData = await quranLocalDataSource.loadQuranFromJson();
      final List<QuranModel> quranModel = quranModelFromJson(jsonData);
      return AppResponse.success(data: quranModel);
    } catch (e) {
      Log.e(_prefix, "getQuranData ERROR ${e.toString()}");
      return AppResponse.error(message: e.toString());
    }
  }

  @override
  Future<AppResponse<List<QuranModel>>> searchSurahName(
      {required String query}) async {
    try {
      var jsonData = await quranLocalDataSource.loadQuranFromJson();
      final List<QuranModel> quranModel = quranModelFromJson(jsonData);
      final List<QuranModel> searchResult = quranModel
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return AppResponse.success(data: searchResult);
    } catch (e) {
      Log.e(_prefix, "searchSurahName ERROR ${e.toString()}");
      return AppResponse.error(message: e.toString());
    }
  }
}
