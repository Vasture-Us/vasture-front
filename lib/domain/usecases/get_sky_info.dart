import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vasture/data/models/sky_info.dart';
import '../repositories/sky_model.dart';
import '../../core/error/failures.dart';

class GetSkyInfo {
  final SkyModelRepository repository;

  GetSkyInfo(this.repository);

  Future<Either<Failure, SkyInfoModel>> call(File image) async {
    return await repository.getSkyImageInfo(image: image);
  }
}
