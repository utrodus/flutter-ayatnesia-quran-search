import 'package:logger/logger.dart';

class Log {
  /// prefix : prefix log message
  final String _prefix;

  /// message : log message
  final String _message;

  /// logger : logger instance
  final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
      methodCount: 3,
    ),
  );

  /// Log.d : debug log
  Log.d(this._prefix, this._message) {
    logger.d("$_prefix : $_message");
  }

  /// Log.i : info log
  Log.i(this._prefix, this._message) {
    logger.i("$_prefix : $_message");
  }

  /// Log.w : warning log
  Log.w(this._prefix, this._message) {
    logger.w("$_prefix : $_message");
  }

  /// Log.e : error log
  Log.e(this._prefix, this._message) {
    logger.e("$_prefix : $_message");
  }

  /// Log.v : verbose log
  Log.v(this._prefix, this._message) {
    logger.v("$_prefix : $_message");
  }
}
