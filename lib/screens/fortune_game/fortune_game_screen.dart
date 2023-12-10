import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/screens/fortune_game/widget/fortune_game.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/scores_panel.dart';
import 'package:fortune_tiger_game_app/widgets/win_dialog.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../widgets/scores_panel/bloc/scores_bloc.dart';

@RoutePage()
class FortuneGameScreen extends StatefulWidget {
  const FortuneGameScreen({super.key});

  @override
  State<FortuneGameScreen> createState() => _FortuneGameScreenState();
}

class _FortuneGameScreenState extends State<FortuneGameScreen> {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/fortune-game-images/background.png",
          height: media.height,
          width: media.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/fortune-game-images/top-image.png',
                      width: media.width,
                      fit: BoxFit.fill),
                  Container(
                      color: AppColors.yellow,
                      height: 5,
                      width: double.infinity),
                ],
              ),
              SizedBox(
                height: media.height * 0.025,
              ),
              FortuneWheelWidget(),
              ScoresPanel(),
            ],
          ),
        ),
        SafeArea(
          child: Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child:
                        Image.asset('assets/images/elements/close-button.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
