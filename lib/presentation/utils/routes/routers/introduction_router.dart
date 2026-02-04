part of '../app_router.dart';

final introductionNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'introduction');

// NOTE: 初期起動時に見る画面の定義
@TypedGoRoute<IntroductionScreenRoute>(
  path: AppRoutes.introduction,
)

class IntroductionScreenRoute extends GoRouteData with _$IntroductionScreenRoute{
  const IntroductionScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const IntroductionScreen();
  }
}
