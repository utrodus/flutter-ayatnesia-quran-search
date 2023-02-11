import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_finder/app/data/local/quran_local_data_source.dart';
import 'package:quran_finder/app/res/constant/app_assets.dart';
import 'package:quran_finder/app/utils/app_response.dart';

import '../../utils/logging.dart';

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  final String _prefix = "QuranLocalDataSourceImpl";
  @override
  Future loadQuranFromJson() async {
    try {
      final String response = await rootBundle.loadString(AppAssets.jsonQuran);
      final responseJson = await json.decode(response);

      return responseJson;
    } catch (e) {
      Log.e(_prefix, "getAllData ERROR ${e.toString()}");
      throw AppResponse.error(message: e.toString());
    }
  }
}
