import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vasture/routes/routes.dart';
import 'package:vasture/presentation/components/navigation_bar.dart';
import 'package:vasture/presentation/screens/weather_book/weather_book_screen.dart';
import 'package:vasture/presentation/screens/weather/weather_screen.dart';

part 'branch/weather_branch.dart';
part 'branch/weather_book_branch.dart';
part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.weather,
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      // TODO: userIdがなかったらIntroductionScreenに遷移する
      return null;
    },
  );
}

// BottomNavigationBarになる際の画面を定義する
@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    weatherStatefulShellBranch,
    weatherBookStatefulShellBranch,
  ],
)

// BottomNavigationBarを表示する
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