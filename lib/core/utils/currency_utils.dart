import 'package:intl/intl.dart';

class CurrencyUtils {
  static String usdFormat(number) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    return oCcy.format(number);
  }
}
