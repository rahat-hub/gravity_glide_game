import 'package:flutter/material.dart';

class TapToStart extends StatelessWidget {

  final bool gameHasStarted;

  const TapToStart({super.key, required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return gameHasStarted 
        ? Container()
        : Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/start_game.png'),
        ),
        Container(
          alignment: const Alignment(0, -0.7),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.pink,
                  ],
                  stops: [0.0, 1.0],
              ).createShader(bounds);
            },
            child: const Text('↓', style: TextStyle(fontSize: 50,color: Colors.red,fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
