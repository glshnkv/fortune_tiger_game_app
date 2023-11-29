import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/blue_menu_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/green_menu_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/red_menu_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/yellow_menu_button_widget.dart';
import 'package:stroke_text/stroke_text.dart';

class MenuDialog extends StatelessWidget {
  const MenuDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      alignment: Alignment.center,
      child: SizedBox(
        width: 320,
        height: 465,
        child: Stack(
          children: [
            Image.asset('assets/images/lobby-images/menu-background.png'),
            SizedBox(
              width: 320,
              height: 465,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StrokeText(
                    text: 'Menu',
                    strokeWidth: 5,
                    strokeColor: AppColors.darkred,
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  RedMenuButtonWidget(title: 'Text', onTap: () {}),
                  SizedBox(height: 10),
                  YellowMenuButtonWidget(title: 'Text', onTap: () {}),
                  SizedBox(height: 10),
                  GreenMenuButtonWidget(title: 'Text', onTap: () {}),
                  SizedBox(height: 10),
                  BlueMenuButtonWidget(title: 'Text', onTap: () {}),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset('assets/images/elements/close-button.png'),
                onPressed: () {
                  context.router.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
