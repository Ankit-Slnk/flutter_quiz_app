import 'package:flutter/material.dart';
import 'package:quizapp/screens/play_quiz_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PlayQuizScreen(),
            ),
          );
        },
        child: const Text("Play Game"),
      ),
    );
  }
}
