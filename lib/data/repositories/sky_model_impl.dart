import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vasture/data/datasources/remote/sky_model_api_datasource.dart';
import 'package:vasture/data/models/sky_info.dart';
import 'package:vasture/domain/repositories/sky_model.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';

class SkyModelRepositoryImpl implements SkyModelRepository {
  final SkyModelApiDatasource dataSource;

  SkyModelRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, SkyInfoModel>> getSkyImageInfo({required File image}) async {
    try {
      final skyInfo = await dataSource.getSkyInfo(image);
      return Right(skyInfo);
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}

