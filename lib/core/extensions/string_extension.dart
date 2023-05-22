import 'package:intl/intl.dart';

extension StringExtension on String {
  String get hour => DateFormat(DateFormat.HOUR24).format(DateTime.parse(this));
  String get hour12 => DateFormat(DateFormat.HOUR).format(DateTime.parse(this));
  String get formattedDate =>
      DateFormat("dd-MM-yyyy").format(DateTime.parse(this));
}
