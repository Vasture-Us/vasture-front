import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vasture/data/models/sky_info.dart';
import '../../core/error/failures.dart';

abstract class SkyModelRepository {
  Future<Either<Failure, SkyInfoModel>> getSkyImageInfo({required File image});
}
