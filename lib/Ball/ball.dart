import 'package:flutter/material.dart';

class Ball extends StatelessWidget {

  final double ballX;
  final double ballY;
  final double ballWidth;
  final double ballHeight;

  const Ball({super.key, required this.ballX, required this.ballY, required this.ballWidth, required this.ballHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(
          (2 * ballX + ballWidth) / (2 - ballWidth),
          (2 * ballY + ballHeight) / (2 - ballHeight)
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2.5 / 3 * ballHeight / 2,
        width: MediaQuery.of(context).size.width * ballWidth / 2,
        child: Image.asset('assets/images/ball.png', fit: BoxFit.fill),
      ),
    );
  }
}
