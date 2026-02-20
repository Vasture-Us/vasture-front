import 'package:intl/intl.dart';

// NOTE: 日付を「January 18th, 2026」や「March 2nd, 2025」と変換するクラス
class CustomDateFormatter {
    String formatDateWithOrdinal(DateTime date) {
    final month = DateFormat('MMMM').format(date);
    final day = date.day;
    final year = date.year;
    final suffix = _ordinalSuffix(day);
    return '$month $day$suffix $year';
  }

  String _ordinalSuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}