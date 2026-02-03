// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
      $introductionScreenRoute,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/weather',
              factory: _$WeatherScreenRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/weatherBook',
              factory: _$WeatherBookScreenRoute._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin _$WeatherScreenRoute on GoRouteData {
  static WeatherScreenRoute _fromState(GoRouterState state) =>
      const WeatherScreenRoute();

  @override
  String get location => GoRouteData.$location(
        '/weather',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WeatherBookScreenRoute on GoRouteData {
  static WeatherBookScreenRoute _fromState(GoRouterState state) =>
      const WeatherBookScreenRoute();

  @override
  String get location => GoRouteData.$location(
        '/weatherBook',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $introductionScreenRoute => GoRouteData.$route(
      path: '/introduction',
      factory: _$IntroductionScreenRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: '/camera',
          parentNavigatorKey: CameraScreenRoute.$parentNavigatorKey,
          factory: _$CameraScreenRoute._fromState,
        ),
      ],
    );

mixin _$IntroductionScreenRoute on GoRouteData {
  static IntroductionScreenRoute _fromState(GoRouterState state) =>
      const IntroductionScreenRoute();

  @override
  String get location => GoRouteData.$location(
        '/introduction',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CameraScreenRoute on GoRouteData {
  static CameraScreenRoute _fromState(GoRouterState state) =>
      const CameraScreenRoute();

  @override
  String get location => GoRouteData.$location(
        '/camera',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'1990c6523c6be85a1392bd25e9667c4af727b168';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
