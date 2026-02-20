import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/helpers/weather_condition_converter.dart';

class WeatherShape extends StatelessWidget {
  final String weatherCondition;
  final String assetPath;

  const WeatherShape({
    super.key,
    required this.weatherCondition,
    this.assetPath  = 'assets/shapes/weather_shape.svg',
  });

  Color _getShapeColor(String condition) {
    return WeatherConditionConverter.getColor(condition) ??
        const Color(0xFFCECDBB);
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        _getShapeColor(weatherCondition),
        BlendMode.srcIn,
      ),
    );
  }
}
