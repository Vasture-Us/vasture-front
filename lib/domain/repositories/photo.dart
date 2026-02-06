import 'package:dartz/dartz.dart';
import '../entities/sky_photo.dart';
import '../entities/photo_match.dart';
import '../../core/error/failures.dart';

abstract class PhotoRepository {
  Future<Either<Failure, SkyPhoto>> uploadPhoto({
    required String userId,
    required String imagePath,
    required String weatherId,
  });
  Future<Either<Failure, List<SkyPhoto>>> getPhotosByMonth(
    String userId,
    int year,
    int month,
  );
  Future<Either<Failure, SkyPhoto?>> getTodayPhotoByOtherUser(
    String currentUserId,
  );
  Future<Either<Failure, PhotoMatch>> saveMatchedPhotos({
    required String userPhotoId,
    required String matchedPhotoId,
  });
  Future<Either<Failure, SkyPhoto>> getPhotoById(String id);
  Future<Either<Failure, List<SkyPhoto>>> getUserPhotos(String userId);
  Future<Either<Failure, SkyPhoto?>> getMatchedPhoto(String photoId);
  Future<Either<Failure, SkyPhoto?>> getLatestUserTodayPhoto(String userId);
}
