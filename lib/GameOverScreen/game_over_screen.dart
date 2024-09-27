import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {

  bool gameHasOver;

  GameOverScreen({super.key, required this.gameHasOver});

  @override
  Widget build(BuildContext context) {
    return gameHasOver ? Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.1),
          child: Image.asset('assets/images/game_over.png'),
        )
      ],
    ) : Container();
  }
}
