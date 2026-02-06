import 'package:flutter/widgets.dart';

enum WeatherConditionType {
  sunny(100, 'Sunny', Color(0xFFCECDBB)),
  cloudy(200, 'Cloudy', Color(0xFF71716F)),
  rainy(300, 'Rainy', Color(0xFF87949B)),
  snowy(400, 'Snowy', Color(0xFFDEDFE0)),
  sleet(430, 'Sleety', Color(0xFF87949B)),
  clear(500, 'Clear', Color(0xFFCECDBB)),
  hot(550, 'Really Hot', Color(0xFFCECDBB)),
  partlyCloudy(600, 'Partly Cloudy', Color(0xFF71716F)),
  lightRain(650, 'Light Rain', Color(0xFF87949B)),
  storm(850, 'Stormy', Color(0xFF87949B)),
  heavySnow(950, 'Heavy Snow', Color(0xFFDEDFE0));

  const WeatherConditionType(this.code, this.label, this.color);

  final int code;
  final String label;
  final Color color;

  static WeatherConditionType? fromCode(int code) {
    for (final condition in WeatherConditionType.values) {
      if (condition.code == code) {
        return condition;
      }
    }
    return null;
  }
}

class WeatherConditionConverter {
  static WeatherConditionType? fromCondition(String condition) {
    final code = int.tryParse(condition) ?? 0;

    return WeatherConditionType.fromCode(code);
  }

  static String? getLabel(String condition) {
    final type = fromCondition(condition);
    return type?.label;
  }

  static int? getCode(String condition) {
    final code = int.tryParse(condition);
    return code;
  }

  static Color? getColor(String condition) {
    final type = fromCondition(condition);
    return type?.color;
  }
}
