import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

class LostDialog extends StatelessWidget {
  const LostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: 370,
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                      'assets/images/elements/grey-popup-large.png'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/elements/lost.png'),
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Stack(
                            children: <Widget>[
                              Text(
                                textAlign: TextAlign.center,
                                'Unfortunately, You Lost',
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
                                'Unfortunately, You Lost',
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
                            'Try again and luck will smile on you',
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
                        context.router.pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
