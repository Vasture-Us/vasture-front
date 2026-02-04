part of '../app_router.dart';

final cameraNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'camera');

@TypedGoRoute<CameraPageViewScreenRoute>(
  path: AppRoutes.cameraPageView,
)

class CameraPageViewScreenRoute extends GoRouteData with _$CameraPageViewScreenRoute{
  const CameraPageViewScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingOverlay(child: CameraPageViewScreen());
  }
}
