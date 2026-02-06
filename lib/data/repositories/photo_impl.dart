import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../domain/entities/sky_photo.dart';
import '../../domain/entities/photo_match.dart';
import '../../domain/repositories/photo.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../datasources/remote/supabase_datasource.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final SupabaseDataSource dataSource;

  PhotoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, SkyPhoto>> uploadPhoto({
    required String userId,
    required String imagePath,
    required String weatherId,
  }) async {
    try {
      final file = File(imagePath);
      final photoModel = await dataSource.uploadPhoto(
        userId: userId,
        imageFile: file,
        weatherId: weatherId,
      );
      return Right(photoModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on StorageException catch (e) {
      return Left(StorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SkyPhoto>> getPhotoById(String id) async {
    try {
      final photoModel = await dataSource.getPhotoById(id);
      return Right(photoModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<SkyPhoto>>> getUserPhotos(String userId) async {
    try {
      final photoModels = await dataSource.getUserPhotos(userId);
      final photos = photoModels.map((m) => m.toEntity()).toList();
      return Right(photos);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<SkyPhoto>>> getPhotosByMonth(
    String userId,
    int year,
    int month,
  ) async {
    try {
      final photoModels =
          await dataSource.getPhotosByMonth(userId, year, month);
      final photos = photoModels.map((m) => m.toEntity()).toList();
      return Right(photos);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SkyPhoto?>> getMatchedPhoto(
      String userPhotoId) async {
    try {
      final matchModel = await dataSource.getMatchedPhoto(userPhotoId);
      return Right(matchModel?.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SkyPhoto?>> getLatestUserTodayPhoto(String userId) async {
    try {
      final photoModel = await dataSource.getLatestUserTodayPhoto(userId);
      return Right(photoModel?.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, SkyPhoto?>> getTodayPhotoByOtherUser(
    String currentUserId,
  ) async {
    try {
      final photoModel =
          await dataSource.getTodayPhotoByOtherUser(currentUserId);
      return Right(photoModel?.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, PhotoMatch>> saveMatchedPhotos({
    required String userPhotoId,
    required String matchedPhotoId,
  }) async {
    try {
      final matchModel = await dataSource.saveMatchedPhotos(
        userPhotoId: userPhotoId,
        matchedPhotoId: matchedPhotoId,
      );
      return Right(matchModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
