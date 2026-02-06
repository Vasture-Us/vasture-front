import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/helpers/weather_condition_converter.dart';

class WeatherShape extends StatelessWidget {
  final String weatherCondition;

  const WeatherShape({
    super.key,
    required this.weatherCondition,
  });

  Color _getShapeColor(String condition) {
    return WeatherConditionConverter.getColor(condition) ??
        const Color(0xFFCECDBB);
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/shapes/weather_shape.svg',
      colorFilter: ColorFilter.mode(
        _getShapeColor(weatherCondition),
        BlendMode.srcIn,
      ),
    );
  }
}
