import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/services/shared_preferences.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';

class FortuneWheelAnimation extends StatelessWidget {
  final AnimationController animationController;
  final int winner;
  final Animation<double> rotationTween;

  FortuneWheelAnimation(
      {Key? key, required this.animationController, required this.winner})
      : rotationTween = Tween<double>(
    begin: 0,
    end: (10 * 360) + (30 * winner.toDouble()),
  ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0, 1, curve: Curves.decelerate))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: const Image(
        image: AssetImage('assets/images/fortune-game-images/fortune-wheel.png'),
      ),
      builder: (context, child) => Transform.rotate(
        angle: ((rotationTween.value % 360) * pi) / 180,
        child: child,
      ),
    );
  }
}

class FortuneWheelWidget extends StatefulWidget {
  const FortuneWheelWidget({Key? key}) : super(key: key);

  @override
  State<FortuneWheelWidget> createState() => _FortuneWheelWidgetState();
}

class _FortuneWheelWidgetState extends State<FortuneWheelWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int winner = Random().nextInt(12);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showWinnerDialog();
      }
    });
  }

  void showWinnerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 270,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                        'assets/images/elements/yellow-popup-large.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/elements/diamond-large.png'),
                        SizedBox(
                          width: 220,
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Congratulations!',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = AppColors.darkred,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Congratulations!',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Text(
                                'You have received ${youWonFunction()} diamonds!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.darkred,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ActionButtonWidget(
                          title: 'OK',
                          onTap: () {
                            context.read<ScoresBloc>().add(
                                AddDiamondsEvent(diamondsCount: int.parse(youWonFunction())));
                            context
                                .read<ScoresBloc>()
                                .add(UpdateScoresEvent());
                            context.router.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  });
  }

  String youWonFunction() {
    List<String> prizes = ['5', '10', '15', '20', '25', '30', '35', '40', '45', '50', '100', '150'];
    return prizes[winner];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
                fit: StackFit.loose,
                alignment: Alignment.topCenter,
                children: [
                  FortuneWheelAnimation(
                    animationController: _controller,
                    winner: winner,
                  ),
                  const Image(
                    image: AssetImage('assets/images/fortune-game-images/arrow.png'),
                  )
                ],
              ),
            SizedBox(
              height: 30,
            ),
            ActionButtonWidget(
              title: 'Spin', onTap: () async {
              SharedPreferencesService storage =
              await SharedPreferencesService.getInstance();
              if (storage.diamonds >= 40) {
                print(winner);
                context.read<ScoresBloc>().add(
                    PayForSpinEvent());
                context
                    .read<ScoresBloc>()
                    .add(UpdateScoresEvent());
                if (_controller.isAnimating) return;
                setState(() {
                  winner = Random().nextInt(12);
                });
                _controller.reset();
                _controller.forward().orCancel;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Oops... Not enough Diamonds',
                        style: TextStyle(color: AppColors.darkred),
                      ),
                      backgroundColor: AppColors.yellow),
                );
              }
                },
            ),
          ],
        ),
      );
  }
}
