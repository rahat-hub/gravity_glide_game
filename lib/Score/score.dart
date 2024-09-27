import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  
  final bestScore;
  final score;
  const Score({super.key,required this.bestScore, required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset('assets/images/score.png',width: 80, height: 80,),
              Text(score.toString(), style: const TextStyle(color: Colors.green,fontSize: 40, fontWeight: FontWeight.bold,fontFamily: 'Signatra'),),
            ],
          ),
          Column(
            children: [
              Image.asset('assets/images/top_score.png',width: 76, height: 76,),
              Text(bestScore.toString(), style: const TextStyle(color: Colors.green,fontSize: 40, fontWeight: FontWeight.bold,fontFamily: 'Signatra'),),
            ],
          ),
        ],
      ),
    );
  }
}
