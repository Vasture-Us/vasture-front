import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import 'core/config/app_config.dart';
import 'core/config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await AppConfig.initialize();
  await SupabaseConfig.initialize();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          // ここでインスタンス化し、Providerの値を上書きします
          await SharedPreferences.getInstance(),
        ),
      ],
      child: VastureApp(),
    ),
  );
}

class VastureApp extends HookConsumerWidget {
  const VastureApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
