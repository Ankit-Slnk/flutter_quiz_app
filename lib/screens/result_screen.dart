import 'package:flutter/material.dart';
import 'package:quizapp/helpers/utility.dart';
import 'package:quizapp/screens/play_quiz_screen.dart';
import 'package:quizapp/widgets/topItemView.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int correctAnswers;
  const ResultScreen({
    super.key,
    required this.score,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  TopItemView(
                    title: "Final Score",
                    text: score.toString(),
                    subText: "",
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  const Spacer(),
                  TopItemView(
                    title: "Correct Question(s)",
                    text: correctAnswers.toString(),
                    subText: " / $totalQuestions",
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                getWinLoseMessage(correctAnswers),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: correctAnswers < 5 ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlayQuizScreen(),
                    ),
                  );
                },
                child: const Text("Play Again"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
