import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vasture/presentation/components/loading/loading_overlay.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/screens/camera/camera_page_view_screen.dart';
import 'package:vasture/presentation/screens/introduction/introduction_screen.dart';
import 'package:vasture/presentation/screens/photo/photo_screen.dart';
import 'package:vasture/presentation/screens/settings/settings_screen.dart';

import 'package:vasture/presentation/utils/routes/routes.dart';
import 'package:vasture/presentation/components/navigation_bar/app_navigation_bar.dart';
import 'package:vasture/presentation/screens/weather_book/weather_book_screen.dart';
import 'package:vasture/presentation/screens/weather/weather_screen.dart';

part 'branch/weather_branch.dart';
part 'branch/weather_book_branch.dart';
part 'routers/introduction_router.dart';
part 'routers/camera_router.dart';
part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.weather,
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) async {
      // await ref.read(sharedPrefsDataSourceProvider).clear();
      final userId = await ref.read(sharedPrefsDataSourceProvider).getUserIdFromRouter();
      final isTutorialCompleted =
          await ref.read(sharedPrefsDataSourceProvider).isTutorialCompleted();

      // NOTE チュートリアルが終わっていて、ユーザーが存在するとWeatherScreenへ！
      if (isTutorialCompleted && userId.isNotEmpty) {
        return null;
      }

      if ((isTutorialCompleted && userId.isEmpty) && state.matchedLocation == AppRoutes.weather) {
        return AppRoutes.introduction;
      }

      if (!isTutorialCompleted && state.matchedLocation == AppRoutes.weather) {
        return AppRoutes.introduction;
      }

      return null;
    },
  );
}

// NOTE BottomNavigationBarのアイテムの画面を定義する
@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    weatherStatefulShellBranch,
    weatherBookStatefulShellBranch,
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return LoadingOverlay(
      child: AppNavigationBar(navigationShell: navigationShell),
    );
  }
}
