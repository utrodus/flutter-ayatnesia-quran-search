import 'package:get_storage/get_storage.dart';

final GetStorage getStorage = GetStorage();

class PrefsManager {
  static Future<void> setFirstTime() async {
    await getStorage.write('first_time', false);
  }

  static bool get isFirstTime => getStorage.read('first_time') ?? true;
}
