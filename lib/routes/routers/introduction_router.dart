part of '../app_router.dart';

final introductionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'introduction');

// NOTE: 初期起動時に見る画面の定義たち
@TypedGoRoute<IntroductionScreenRoute>(
  path: AppRoutes.introduction,
  routes: [
    TypedGoRoute<CameraScreenRoute>(
      path: AppRoutes.camera,
    ),
  ],
)

// ルート定義とページの構築
class IntroductionScreenRoute extends GoRouteData with _$IntroductionScreenRoute{
  const IntroductionScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const IntroductionScreen();
  }
}

class CameraScreenRoute extends GoRouteData with _$CameraScreenRoute{
  const CameraScreenRoute();
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CameraScreen();
  }
}