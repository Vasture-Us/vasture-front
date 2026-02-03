part of '../app_router.dart';

class WeatherBookShellBranch extends StatefulShellBranchData {
  const WeatherBookShellBranch();
}

// NOTE WeatherBookタブの定義
const weatherBookStatefulShellBranch = TypedStatefulShellBranch<WeatherBookShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<WeatherBookScreenRoute>(
      path: AppRoutes.weatherBook,
    ),
  ],
);

class WeatherBookScreenRoute extends GoRouteData with _$WeatherBookScreenRoute{
  const WeatherBookScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WeatherBookScreen();
  }
}