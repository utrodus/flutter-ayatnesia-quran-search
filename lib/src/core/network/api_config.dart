class ApiConfig {
  ApiConfig._();
  // static const String baseUrl = "https://riset.unublitar.ac.id/ayatnesia/api";
  static const String baseUrl = "http://127.0.0.1:8000/api";
  static const Duration receiveTimeout = Duration(seconds: 500);
  static const Duration connectionTimeout = Duration(seconds: 500);

  static const String allSurah = '/all-surahs';
  static const String detailSurah = '/detail';
  static const String searchVerses = '/search';

  static const header = {
    'content-Type': 'application/json',
  };
}
