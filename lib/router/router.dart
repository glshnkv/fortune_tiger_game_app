import 'package:auto_route/auto_route.dart';
import 'package:fortune_tiger_game_app/screens/onboarding/onboarding_screen.dart';
import 'package:fortune_tiger_game_app/screens/lobby/lobby_screen.dart';
import 'package:fortune_tiger_game_app/screens/fortune_game/fortune_game_screen.dart';
import 'package:fortune_tiger_game_app/screens/daily_bonus/daily_bonus_screen.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: LobbyRoute.page),
    AutoRoute(page: FortuneGameRoute.page),
    AutoRoute(page: DailyBonusRoute.page),

  ];
}