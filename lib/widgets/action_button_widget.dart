import 'package:flutter/widgets.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:stroke_text/stroke_text.dart';

class ActionButtonWidget extends StatefulWidget {
  final String title;
  final void Function()? onTap;

  const ActionButtonWidget({super.key, required this.title, required this.onTap});

  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return SizedBox(
      height: media.height * 0.08,
      child: GestureDetector(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/elements/main-button.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: media.height * 0.01, horizontal: 25),
                child: StrokeText(
                  text: widget.title,
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  strokeColor: AppColors.darkred,
                  strokeWidth: 5,
                ),
              ),
            ),
          ],
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
