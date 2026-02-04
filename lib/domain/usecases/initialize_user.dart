import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/user.dart';
import '../../core/error/failures.dart';
import '../../core/utils/uuid_generator.dart';

class InitializeUser {
  final UserRepository repository;

  InitializeUser(this.repository);

  Future<Either<Failure, User>> call() async {
    final localIdResult = await repository.getLocalUserId();

    return await localIdResult.fold(
      (failure) async {
        final newId = UuidGenerator.generate();

        final saveResult = await repository.saveLocalUserId(newId);
        if (saveResult.isLeft()) {
          return Left(saveResult.fold(
              (l) => l, (r) => const CacheFailure('Failed to save user ID')));
        }

        return await repository.createUser(newId);
      },
      (userId) async {
        final userResult = await repository.getUser(userId);

        return await userResult.fold(
          (failure) async {
            return await repository.createUser(userId);
          },
          (user) async {
            return Right(user);
          },
        );
      },
    );
  }
}
