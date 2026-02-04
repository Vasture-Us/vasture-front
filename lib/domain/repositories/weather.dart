import 'package:dartz/dartz.dart';
import '../entities/weather.dart';
import '../../core/error/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather({
    required double latitude,
    required double longitude,
  });

  Future<Either<Failure, Weather>> saveWeather({
    required String condition,
    required double temperature,
    required String location,
  });
}
