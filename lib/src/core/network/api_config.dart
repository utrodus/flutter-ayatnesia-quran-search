class ApiConfig {
  ApiConfig._();

  /// Base URL configuration for the Flutter Ayatnesia project:
  /// If running API locally (https://github.com/utrodus/fastapi-ayatnesia), use the following base URL:
  /// local development
  /// - **Android Emulator**: `http://10.0.2.2:8000`
  /// - **iOS Emulator or Real Device**: `http://localhost:8000`
  ///
  /// For production or live API access, use:
  /// - **Live API**: `https://api.ayatnesia.unublitar.ac.id/api`
  ///   This is the base URL for accessing the live version of the API in a production environment.

  static const String baseUrl = "https://api.ayatnesia.unublitar.ac.id/api";

  static const Duration receiveTimeout = Duration(seconds: 500);
  static const Duration connectionTimeout = Duration(seconds: 500);

  static const String allSurah = '/all-surahs';
  static const String detailSurah = '/detail';
  static const String searchVerses = '/search';

  static const header = {
    'content-Type': 'application/json',
  };
}
