import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/router/router.dart';
import 'package:fortune_tiger_game_app/screens/lobby/widgets/menu_dialog.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  final controller = PageController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/lobby-images/background.png",
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
              CarouselSlider(
                options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.5,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: [
                  Image.asset('assets/images/lobby-images/fortune-card.png'),
                  Image.asset('assets/images/lobby-images/slot-card.png'),
                  Image.asset('assets/images/lobby-images/bonuses-card.png'),
                ],
              ),
              AnimatedSmoothIndicator(
                count: 3,
                activeIndex: _current,
                effect: WormEffect(
                  activeDotColor: AppColors.yellow,
                  dotColor: Color.fromRGBO(255, 255, 255, 0.36),
                ),
              ),
              ActionButtonWidget(
                title: _current == 2 ? 'Get bonuses' : 'Start to play',
                onTap: () {
                  if (_current == 0) {
                    context.router.push(FortuneGameRoute());
                  } else if (_current == 1) {
                    context.router.push(SlotMachineRoute());
                  } else if (_current == 2) {
                    context.router.push(DailyBonusRoute());
                    context.read<ScoresBloc>().add(AddGiftsEvent(giftsCount: 1));
                  }
                },
              ),
              TextButton(
                child: StrokeText(
                  text: 'Menu',
                  strokeWidth: 5,
                  strokeColor: AppColors.darkred,
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () async {
                  await showDialog(
                      context: context, builder: (_) => MenuDialog());
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
