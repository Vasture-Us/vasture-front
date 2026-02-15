import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get weatherApiKey => dotenv.env['WEATHER_API_KEY'] ?? '';
  static String get weatherApiUrl => dotenv.env['WEATHER_API_URL'] ?? '';
  static String get otherImageUrl => dotenv.env['OTHER_IMAGE_URL'] ?? '';
  static String get skyModelApiUrl => dotenv.env['SKY_MODEL_API_URL'] ?? '';

  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
  }
}
