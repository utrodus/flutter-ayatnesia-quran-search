class ApiConfig {
  ApiConfig._();

  /// for android emulator use http://10.0.2.2:8000
  ///
  /// for ios emulator or real device use http://localhost:8000
  static const String baseUrl = "http://10.0.2.2:8000/api";

  static const Duration receiveTimeout = Duration(seconds: 500);
  static const Duration connectionTimeout = Duration(seconds: 500);

  static const String allSurah = '/all-surahs';
  static const String detailSurah = '/detail';
  static const String searchVerses = '/search';

  static const header = {
    'content-Type': 'application/json',
  };
}
