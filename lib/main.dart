import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fortune_tiger_game_app/fortune_tiger_game_app.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/repository/gifts_repository.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await GetIt.instance.registerSingleton(DiamondsRepository());
  await GetIt.instance.registerSingleton(GiftsRepository());

  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ScoresBloc>(
          create: (context) => ScoresBloc(
              GetIt.I<DiamondsRepository>(), GetIt.I<GiftsRepository>())),
    ],
    child: FortuneTigerGameApp(),
  ));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}
