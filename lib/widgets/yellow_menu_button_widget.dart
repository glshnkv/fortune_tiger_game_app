import 'package:flutter/widgets.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:stroke_text/stroke_text.dart';

class YellowMenuButtonWidget extends StatefulWidget {
  final String title;
  final void Function()? onTap;

  const YellowMenuButtonWidget({super.key, required this.title, required this.onTap});

  @override
  State<YellowMenuButtonWidget> createState() => _YellowMenuButtonWidgetState();
}

class _YellowMenuButtonWidgetState extends State<YellowMenuButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/elements/yellow-menu-button.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
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
    );
  }
}
