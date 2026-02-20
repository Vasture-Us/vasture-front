import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../datasources/local/shared_prefs_datasource.dart';
import '../datasources/remote/supabase_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final SupabaseDataSource remoteDataSource;
  final SharedPrefsDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final userModel = await remoteDataSource.getUser(id);

      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(String id) async {
    try {
      final userModel = await remoteDataSource.createUser(id);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> getLocalUserId() async {
    try {
      final userId = await localDataSource.getUserId();
      return Right(userId);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocalUserId(String id) async {
    try {
      await localDataSource.saveUserId(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserById(String id) async {
    try {
      await remoteDataSource.deleteUser(id);
      await localDataSource.clear();

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
