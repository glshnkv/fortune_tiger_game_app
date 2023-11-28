import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/router/router.dart';

class FortuneTigerGameApp extends StatelessWidget {
  FortuneTigerGameApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Montserrat'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
