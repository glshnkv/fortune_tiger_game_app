import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_tiger_game_app/screens/slot_machine/widget/slot_machine_game.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/scores_panel.dart';


@RoutePage()
class SlotMachineScreen extends StatefulWidget {
  const SlotMachineScreen({super.key});

  @override
  State<SlotMachineScreen> createState() => _SlotMachineScreenState();
}

class _SlotMachineScreenState extends State<SlotMachineScreen> {

  @override
  void initState() {
    super.initState();
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
                height: 25,
              ),
              SlotMachineGame(),
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
