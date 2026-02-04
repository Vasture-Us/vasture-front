abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

class CameraFailure extends Failure {
  const CameraFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}
