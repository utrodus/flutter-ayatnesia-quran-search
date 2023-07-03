class ApiConfig {
  ApiConfig._();
  static const String baseUrl = "http://riset.unublitar.ac.id/ayatnesia/api";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static const String allSurah = '/all-surahs';
  static const String detailSurah = '/detail';
  static const String searchVerses = '/search';

  static const header = {
    'content-Type': 'application/json',
  };
}
