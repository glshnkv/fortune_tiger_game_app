import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/services/shared_preferences.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'dart:async';
import 'dart:math';

import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/lost_dialog.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';
import 'package:fortune_tiger_game_app/widgets/win_dialog.dart';

class SlotMachineGame extends StatefulWidget {
  @override
  _SlotMachineGameState createState() => _SlotMachineGameState();
}

class _SlotMachineGameState extends State<SlotMachineGame> {
  final List<String> images = [
    'assets/images/slot-machine-images/cake.png',
    'assets/images/slot-machine-images/cookie.png',
    'assets/images/slot-machine-images/waffles.png',
  ];

  Random _random = Random();
  bool isSpinning = false;
  List<int> selectedImages = [0, 0, 0];

  Future<void> spin() async {
    if (!isSpinning) {
      isSpinning = true;
      for (int i = 0; i < 5; i++) {
        setState(() {
          selectedImages[0] = _random.nextInt(images.length);
          selectedImages[1] = _random.nextInt(images.length);
          selectedImages[2] = _random.nextInt(images.length);
        });
        await Future.delayed(Duration(seconds: 1));
      }
      isSpinning = false;
      checkWin();
    }
  }

  void checkWin() {
    Future.delayed(const Duration(seconds: 1));
    if (selectedImages.every((element) => element == selectedImages[0])) {
      context.read<ScoresBloc>().add(AddDiamondsEvent(diamondsCount: 1000));
      context.read<ScoresBloc>().add(UpdateScoresEvent());
      showDialog(context: context, builder: (_) => WinDialog());
    } else {
      showDialog(context: context, builder: (_) => const LostDialog());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                child: Align(
                  child: Image.asset(
                      'assets/images/slot-machine-images/slot-machine.png'),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 225,
                  width: 250,
                  child: Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Roll(image: images[selectedImages[0]]),
                          Roll(image: images[selectedImages[1]]),
                          Roll(image: images[selectedImages[2]]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          ActionButtonWidget(
            title: 'Spin',
            onTap: () async {
              SharedPreferencesService storage =
                  await SharedPreferencesService.getInstance();
              if (storage.diamonds >= 40) {
                spin();
                context.read<ScoresBloc>().add(PayForSpinEvent());
                context.read<ScoresBloc>().add(UpdateScoresEvent());
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                        'Oops... Not enough Diamonds',
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

class Roll extends StatelessWidget {
  final String image;

  Roll({required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 500), child: Image.asset(image, height: 55, width: 55));
  }
}
