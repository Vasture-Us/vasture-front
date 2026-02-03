part of '../app_router.dart';

final weatherNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'weather');

class WeatherShellBranch extends StatefulShellBranchData {
  const WeatherShellBranch();
}

// NOTE ホームタブの定義
const weatherStatefulShellBranch = TypedStatefulShellBranch<WeatherShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<WeatherScreenRoute>(
      path: AppRoutes.weather,
    ),
  ],
);

class WeatherScreenRoute extends GoRouteData with _$WeatherScreenRoute {
  const WeatherScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WeatherScreen();
  }
}
