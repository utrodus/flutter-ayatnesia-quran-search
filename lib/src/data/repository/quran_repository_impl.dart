import 'package:ayat_nesia/src/data/repository/quran_repository.dart';
import '../../core/network/app_response.dart';
import '../../core/utils/logging.dart';
import '../local/quran_local_data_source.dart';
import '../models/quran_model.dart';

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
