import 'package:flutter/widgets.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:stroke_text/stroke_text.dart';

class GreenMenuButtonWidget extends StatefulWidget {
  final String title;
  final void Function()? onTap;

  const GreenMenuButtonWidget({super.key, required this.title, required this.onTap});

  @override
  State<GreenMenuButtonWidget> createState() => _GreenMenuButtonWidgetState();
}

class _GreenMenuButtonWidgetState extends State<GreenMenuButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/elements/green-menu-button.png'),
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
