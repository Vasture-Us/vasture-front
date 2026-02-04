import 'package:dartz/dartz.dart';
import '../entities/sky_photo.dart';
import '../repositories/photo.dart';
import '../../core/error/failures.dart';

class GetMatchedPhoto {
  final PhotoRepository repository;

  GetMatchedPhoto(this.repository);

  Future<Either<Failure, SkyPhoto?>> call(String userPhotoId) async {
    final matchResult = await repository.getMatchedPhoto(userPhotoId);

    return await matchResult.fold(
      (failure) => Left(failure),
      (match) async {
        if (match == null) {
          return const Right(null);
        }

        // Get the other photo in the match
        final otherPhotoId =
            match.userPhotoId == userPhotoId ? match.matchedPhotoId : match.userPhotoId;

        final photoResult = await repository.getPhotoById(otherPhotoId);

        return photoResult.fold(
          (failure) => Left(failure),
          (photo) => Right(photo),
        );
      },
    );
  }
}
