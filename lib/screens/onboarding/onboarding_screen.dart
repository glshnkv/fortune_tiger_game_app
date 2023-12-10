import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/router/router.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboarding-images/1.png'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Stack(
                  children: <Widget>[
                    Text(
                      textAlign: TextAlign.center,
                      'We\'re delighted to have you on board for an exciting journey filled with puzzles, prizes, and endless fun',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 5
                          ..color = AppColors.darkred,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'We\'re delighted to have you on board for an exciting journey filled with puzzles, prizes, and endless fun',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              ActionButtonWidget(
                title: 'Continue',
                onTap: () {
                  context.router.push(const LobbyRoute());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('Terms of Use',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w600))),
                  Text('|',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Privacy Policy',
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w600))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
