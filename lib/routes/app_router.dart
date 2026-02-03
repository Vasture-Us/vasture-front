import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vasture/presentation/providers/tutorial_provider.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/screens/camera/camera_screen.dart';
import 'package:vasture/presentation/screens/introduction/introduction_screen.dart';

import 'package:vasture/routes/routes.dart';
import 'package:vasture/presentation/components/navigation_bar/app_navigation_bar.dart';
import 'package:vasture/presentation/screens/weather_book/weather_book_screen.dart';
import 'package:vasture/presentation/screens/weather/weather_screen.dart';

part 'branch/weather_branch.dart';
part 'branch/weather_book_branch.dart';
part 'routers/introduction_router.dart';
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
      final tutorialState = ref.read(tutorialProvider);
      final userState = ref.read(userProvider);

      // NOTE チュートリアルが終わっていて、ユーザーが存在するとWeatherScreenへ！
      if (tutorialState.isCompleted && userState.user != null) {
        return AppRoutes.weather;
      } else {
        return AppRoutes.introduction;
      }
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
    return AppNavigationBar(navigationShell: navigationShell);
  }
}
