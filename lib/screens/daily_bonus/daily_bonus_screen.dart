import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/scores_panel.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class DailyBonusScreen extends StatefulWidget {
  const DailyBonusScreen({super.key});

  @override
  State<DailyBonusScreen> createState() => _DailyBonusScreenState();
}

class _DailyBonusScreenState extends State<DailyBonusScreen> {
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
                height: 320,
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                            'assets/images/elements/yellow-popup-small.png'),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: StrokeText(
                          text: 'Daily bonus Name',
                          strokeWidth: 5,
                          strokeColor: AppColors.darkred,
                          textStyle: TextStyle(
                            fontSize: 25,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                            'assets/images/elements/present-large.png'),
                      ),
                    ),
                  ],
                ),
              ),
              ActionButtonWidget(
                  title: 'OK',
                  onTap: () {
                    context.router.pop();
                  }),
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
