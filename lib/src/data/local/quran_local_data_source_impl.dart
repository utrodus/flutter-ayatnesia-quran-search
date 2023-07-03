import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/res/constant/app_assets.dart';
import '../../core/network/app_response.dart';
import '../../core/utils/logging.dart';
import 'quran_local_data_source.dart';

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
