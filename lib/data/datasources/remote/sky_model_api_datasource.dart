import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vasture/data/models/sky_info.dart';

part 'sky_model_api_datasource.g.dart';

@RestApi()
abstract class SkyModelApiDatasource {
  factory SkyModelApiDatasource(Dio dio, {String baseUrl}) = _SkyModelApiDatasource;

  @POST('/sky_info')
  @MultiPart()
  Future<SkyInfoModel> getSkyInfo(
    @Part() File file,
  );
}
