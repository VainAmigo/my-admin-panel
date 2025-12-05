  import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String get formatted => DateFormat('dd.MM.yyyy').format(this);
}
