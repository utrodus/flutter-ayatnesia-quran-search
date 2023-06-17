import 'package:ayat_nesia/app/data/models/quran_model.dart';
import 'package:ayat_nesia/app/utils/app_response.dart';

abstract class QuranRepository {
  Future<AppResponse<List<QuranModel>>> getQuranData();
  Future<AppResponse<List<QuranModel>>> searchSurahName({
    required String query,
  });
}
