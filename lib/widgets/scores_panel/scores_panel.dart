import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/repository/diamonds_repository.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

class ScoresPanel extends StatefulWidget {
  const ScoresPanel({super.key});

  @override
  State<ScoresPanel> createState() => _ScoresPanelState();
}

class _ScoresPanelState extends State<ScoresPanel> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoresBloc, ScoresState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UpdateScoresState) {
          return Padding(
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
                                  text: '${state.diamondsCount}',
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
                                  text: '${state.giftsCount}',
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
          );
        } else {
          return Container();
        }
      },
    );
  }
}
