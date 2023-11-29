import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class FortuneGameScreen extends StatefulWidget {
  const FortuneGameScreen({super.key});

  @override
  State<FortuneGameScreen> createState() => _FortuneGameScreenState();
}

class _FortuneGameScreenState extends State<FortuneGameScreen> {
  late Timer timer;
  late Random random;
  late String result;
  late double degree;
  late int time;
  late int score;

  @override
  void initState() {
    super.initState();

    random = Random();
    degree = 0;
    result = '';
    score = 0;
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
                  Image.asset('assets/images/fortune-game-images/top-image.png',
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
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Transform.rotate(
                          angle: pi / 180 * degree,
                          child: Image.asset(
                              'assets/images/fortune-game-images/fortune-wheel.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                            'assets/images/fortune-game-images/arrow.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Text(result),
              ActionButtonWidget(
                  title: 'Spin!',
                  onTap: () {
                    rotateWheel();
                  }),
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
                                      text: '${score}',
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
                                      text: '${score}',
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

  void rotateWheel() {
    time = 3000;

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(360).toDouble();
          result = calculatePoint(degree);
          switch (int.parse(result)) {
            case 1:
              result = '5';
            case 2:
              result = '10';
            case 3:
              result = '15';
            case 4:
              result = '20';
            case 5:
              result = '25';
            case 6:
              result = '30';
            case 7:
              result = '35';
            case 8:
              result = '40';
            case 9:
              result = '45';
            case 10:
              result = '50';
            case 11:
              result = '100';
            case 12:
              result = '150';
          }
        });
        time = time - 100;
      }
    });
  }

  String calculatePoint(double degree) {
    String res = '';
    int lowPoint = 0;
    int arc = 30;
    int sectors = 12;

    for (int i = sectors; i > 0; i--) {
      if (degree > lowPoint && degree < lowPoint + arc) {
        res = i.toString();
        break;
      }
      lowPoint = lowPoint + arc;
    }
    return res;
  }
}
