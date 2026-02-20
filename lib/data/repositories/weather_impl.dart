import 'package:dartz/dartz.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../datasources/remote/weather_api_datasource.dart';
import '../datasources/remote/supabase_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiDataSource apiDataSource;
  final SupabaseDataSource supabaseDataSource;

  WeatherRepositoryImpl({
    required this.apiDataSource,
    required this.supabaseDataSource,
  });

  @override
  Future<Either<Failure, Weather>> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final wxModel = await apiDataSource.getCurrentWeather(
        latitude: latitude,
        longitude: longitude,
      );

      final todaySrf = wxModel.wxdata[0].srf[0];
      final wxData = wxModel.wxdata[0];

      return Right(
        // NOTE: idやcreatedAtはDBで自動生成するため空文字 (この値たちはセーブされない)
        Weather(
          id: '',
          condition: todaySrf.wx.toString(),
          temperature: todaySrf.temp.toDouble(),
          location: '${wxData.lat},${wxData.lon}',
          createdAt: DateTime.now(),
        ),
      );
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Weather>> saveWeather({
    required String condition,
    required double temperature,
    required String location,
  }) async {
    try {
      final weatherModel = await supabaseDataSource.saveWeather(
        condition: condition,
        temperature: temperature,
        location: location,
      );
      return Right(weatherModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Weather>> getWeatherById({required String id}) async {
    try {
      final weatherModel = await supabaseDataSource.getWeatherById(id: id);
      return Right(weatherModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
