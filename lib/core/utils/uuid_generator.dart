import 'package:uuid/uuid.dart';

class UuidGenerator {
  static const Uuid _uuid = Uuid();

  static String generate() {
    return _uuid.v4();
  }
}
