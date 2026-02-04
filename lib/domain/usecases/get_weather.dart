import 'package:dartz/dartz.dart';
import 'package:vasture/domain/entities/weather.dart';
import '../repositories/weather.dart';
import '../../core/error/failures.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, Weather>> call({
    required double latitude,
    required double longitude,
  }) async {
    return await repository.getCurrentWeather(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
