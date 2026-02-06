part of '../app_router.dart';

class WeatherBookShellBranch extends StatefulShellBranchData {
  const WeatherBookShellBranch();
}

// NOTE WeatherBookタブの定義
const weatherBookStatefulShellBranch =
    TypedStatefulShellBranch<WeatherBookShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<WeatherBookScreenRoute>(
      path: AppRoutes.weatherBook,
      routes: [
        TypedGoRoute<PhotoScreenRoute>(
          path: WeatherBookAppRoutes.photo,
        ),
        TypedGoRoute<SettingScreenRoute>(
          path: WeatherBookAppRoutes.setting,
        ),
      ],
    ),
  ],
);

class WeatherBookScreenRoute extends GoRouteData with _$WeatherBookScreenRoute {
  const WeatherBookScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WeatherBookScreen();
  }
}
class PhotoScreenParam {
  final int year;
  final int month;
  final String monthName;

  const PhotoScreenParam({required this.year, required this.month, required this.monthName});
}

class PhotoScreenRoute extends GoRouteData with _$PhotoScreenRoute {
  const PhotoScreenRoute(this.$extra,);

  final String $extra;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PhotoScreen(
      date: $extra,
    );
  }
}

class SettingScreenRoute extends GoRouteData with _$SettingScreenRoute {
  const SettingScreenRoute();


  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}
