

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gravity_glide/Ball/ball.dart';
import 'package:gravity_glide/Barricade/barricade.dart';
import 'package:gravity_glide/GameOverScreen/game_over_screen.dart';
import 'package:gravity_glide/Score/score.dart';
import 'package:gravity_glide/TapToStart/tap_to_start.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool centralJump = false;
  bool gameHasStarted = false;
  bool gameHasOver = false;
  bool ballHasPassedBarricade = false;

  int score = 0;
  int bestScore = 0;

  double time = 0;
  double height = 0;
  double gravity = 12;
  double velocity = 6;

  double ballX = -0.5;
  double ballY = 1;
  double ballWidth = 0.2;
  double ballHeight = 0.1;

  double barricadeX = 1;
  double barricadeY = 1;
  double barricadeWidth = 0.4;
  double barricadeHeight = 0.25;


  void resetJumpBall() {
    centralJump = false;
    time = 0;
  }

  void playGameAgain() {
    setState(() {

      gameHasOver = false;
      gameHasStarted = false;

      barricadeX = 0.2;
      score = 0;

      ballY = 1;
      centralJump = false;

    });
  }

  void updateForScore() {
    if(barricadeX < ballX && ballHasPassedBarricade == false) {
      setState(() {
        ballHasPassedBarricade = true;
        score++;
      });
    }
  }

  bool detectForCollision() {
    if(barricadeX <= ballX + ballWidth
        && barricadeX + barricadeWidth >= ballX
        && ballY >= barricadeY - barricadeHeight) {
      return true;
    }
    return false;
  }

  void loopForBarricade() {
    setState(() {
      if(barricadeX <= -1.2) {
        barricadeX = 1.2;
        ballHasPassedBarricade = false;
      }
    });
  }

  void startGame() {
    setState(() {
      gameHasStarted = true;
    });
    Timer.periodic(const Duration(milliseconds: 10), (timer){
      if(detectForCollision()) {
        gameHasOver = true;
        timer.cancel();
        setState(() {
          if(score > bestScore) {
            bestScore = score;
          }
        });
      }
      loopForBarricade();

      updateForScore();

      setState(() {
        barricadeX -= 0.01;
      });
    });
  }

  void jumpBall() {
    centralJump = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = -gravity / 2 * time * time + velocity * time;
      setState(() {
        if(1 - height > 1) {
          resetJumpBall();
          ballY = 1;
          timer.cancel();
        }
        else {
          ballY = 1 - height;
        }
      });

      if(gameHasOver) {
        timer.cancel();
      }

      time += 0.01;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasOver ? (playGameAgain) : (gameHasStarted ? (centralJump ? null : jumpBall) : startGame),
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sky.jpg'),
              fit: BoxFit.cover
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Stack(
                        children: [
                          TapToStart(gameHasStarted: gameHasStarted),
                          Score(bestScore: bestScore, score: score),
                          Ball(ballX: ballX, ballY: ballY - ballHeight, ballWidth: ballWidth, ballHeight: ballHeight),
                          Barricade(barricadeX: barricadeX, barricadeY:  barricadeY - barricadeHeight, barricadeWidth: barricadeWidth, barricadeHeight: barricadeHeight),
                          GameOverScreen(gameHasOver: gameHasOver),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[600],
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/ground.jpg',fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                          const Positioned.fill(
                            child: Center(
                              child: Text('Garvity Glider',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bebas',
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.pink,
                                        offset: Offset(2, 2)
                                      )
                                    ]
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
