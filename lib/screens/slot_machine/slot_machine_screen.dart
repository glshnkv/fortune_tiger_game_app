import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/lost_dialog.dart';
import 'package:fortune_tiger_game_app/widgets/win_dialog.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class SlotMachineScreen extends StatefulWidget {
  const SlotMachineScreen({super.key});

  @override
  State<SlotMachineScreen> createState() => _SlotMachineScreenState();
}

class _SlotMachineScreenState extends State<SlotMachineScreen> {
  late SlotMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/fortune-game-images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/lobby-images/top-image.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill),
                  Container(
                      color: AppColors.yellow,
                      height: 5,
                      width: double.infinity),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Center(
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
                        SizedBox(
                          height: 225,
                          child: Positioned(
                            child: Align(
                              child: SlotMachine(
                                width: 266,
                                height: 80,
                                reelWidth: 71,
                                reelSpacing: 26,
                                rollItems: [
                                  RollItem(
                                      index: 0,
                                      child: Image.asset(
                                          'assets/images/slot-machine-images/cake.png')),
                                  RollItem(
                                      index: 1,
                                      child: Image.asset(
                                          'assets/images/slot-machine-images/cookie.png')),
                                  RollItem(
                                      index: 2,
                                      child: Image.asset(
                                          'assets/images/slot-machine-images/waffles.png')),
                                ],
                                onCreated: (controller) {
                                  _controller = controller;
                                },
                                onFinished: (resultIndexes) {
                                  print('Result: $resultIndexes');
                                  if (resultIndexes[0] == resultIndexes[1] &&
                                      resultIndexes[1] == resultIndexes[2]) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => WinDialog());
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (_) => const LostDialog());
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: TextButton(
                                child: StrokeText(
                                  text: 'STOP',
                                  strokeWidth: 5,
                                  strokeColor: AppColors.darkred,
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () => onButtonTap(index: 0)),
                          ),
                          SizedBox(width: 22),
                          SizedBox(
                            child: TextButton(
                                child: StrokeText(
                                  text: 'STOP',
                                  strokeWidth: 5,
                                  strokeColor: AppColors.darkred,
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () => onButtonTap(index: 1)),
                          ),
                          SizedBox(width: 22),
                          SizedBox(
                            child: TextButton(
                                child: StrokeText(
                                  text: 'STOP',
                                  strokeWidth: 5,
                                  strokeColor: AppColors.darkred,
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () => onButtonTap(index: 2)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: ActionButtonWidget(
                        title: 'Spin',
                        onTap: () => onStart(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/elements/diamond-small.png'),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      'assets/images/elements/score-background.png'),
                                ),
                              ),
                              Positioned(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StrokeText(
                                      text: '0',
                                      strokeWidth: 5,
                                      strokeColor: AppColors.darkred,
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      'assets/images/elements/score-background.png'),
                                ),
                              ),
                              Positioned(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StrokeText(
                                      text: '0',
                                      strokeWidth: 5,
                                      strokeColor: AppColors.darkred,
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/images/elements/present-small.png'),
                      ],
                    ),
                  ],
                ),
              ),
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
