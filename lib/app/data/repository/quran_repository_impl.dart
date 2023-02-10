import 'package:quran_finder/app/data/local/quran_local_data_source.dart';
import 'package:quran_finder/app/data/models/quran_model.dart';
import 'package:quran_finder/app/data/repository/quran_repository.dart';
import 'package:quran_finder/app/utils/app_response.dart';

import '../../utils/logging.dart';

class QuranRepositoryImpl extends QuranRepository {
  final String _prefix = "QuranRepositoryImpl";
  final QuranLocalDataSource quranLocalDataSource;
  QuranRepositoryImpl({required this.quranLocalDataSource});

  @override
  Future<AppResponse<List<QuranModel>>> getQuranData() async {
    try {
      var jsonString = await quranLocalDataSource.loadQuranFromJson();
      final List<QuranModel> quranModel = quranModelFromJson(jsonString);
      return AppResponse.success(quranModel);
    } catch (e) {
      Log.e(_prefix, "getQuran ERROR ${e.toString()}");
      return AppResponse.error(e.toString());
    }
  }
}
