import '../../core/network/app_response.dart';
import '../models/quran_model.dart';

abstract class QuranRepository {
  Future<AppResponse<List<QuranModel>>> getQuranData();
  Future<AppResponse<List<QuranModel>>> searchSurahName({
    required String query,
  });
}
