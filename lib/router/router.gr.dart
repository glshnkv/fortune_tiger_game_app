// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DailyBonusRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DailyBonusScreen(),
      );
    },
    FortuneGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FortuneGameScreen(),
      );
    },
    LobbyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LobbyScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
  };
}

/// generated route for
/// [DailyBonusScreen]
class DailyBonusRoute extends PageRouteInfo<void> {
  const DailyBonusRoute({List<PageRouteInfo>? children})
      : super(
          DailyBonusRoute.name,
          initialChildren: children,
        );

  static const String name = 'DailyBonusRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FortuneGameScreen]
class FortuneGameRoute extends PageRouteInfo<void> {
  const FortuneGameRoute({List<PageRouteInfo>? children})
      : super(
          FortuneGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'FortuneGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LobbyScreen]
class LobbyRoute extends PageRouteInfo<void> {
  const LobbyRoute({List<PageRouteInfo>? children})
      : super(
          LobbyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LobbyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
