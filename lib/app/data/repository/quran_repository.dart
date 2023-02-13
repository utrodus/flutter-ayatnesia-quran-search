import 'package:quran_finder/app/data/models/quran_model.dart';
import 'package:quran_finder/app/utils/app_response.dart';

abstract class QuranRepository {
  Future<AppResponse<List<QuranModel>>> getQuranData();
  Future<AppResponse<List<QuranModel>>> searchSurahName({
    required String query,
  });
}
