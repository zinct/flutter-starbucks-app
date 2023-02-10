import 'package:logger/logger.dart';

class Log {
  static Logger _logger = Logger();

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }
}
