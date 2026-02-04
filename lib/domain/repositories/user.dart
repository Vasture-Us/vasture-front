import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> createUser(String id);
  Future<Either<Failure, String>> getLocalUserId();
  Future<Either<Failure, void>> saveLocalUserId(String id);
}
