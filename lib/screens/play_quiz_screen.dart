import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/helpers/utility.dart';
import 'package:quizapp/helpers/database_helper.dart';
import 'package:quizapp/models/option_details.dart';
import 'package:quizapp/models/question_details.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/widgets/questionOptionsView.dart';
import 'package:quizapp/widgets/topItemView.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  // questions
  List<QuestionDetails> questions = [];
  int currentQuestionIndex = 0;

  // options
  int selectedOptionIndex = -1;
  OptionDetails? selectedOption;

  // button background color
  MaterialStateProperty<Color?>? buttonBgColor;

  // timer
  Timer? timer;
  int timerStart = 0;

  // score
  int score = 0;
  int correctAnswers = 0;

  void startQuestionTimer() {
    timerStart = totalSecPerQuestion;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timerStart == 1) {
          timer.cancel();
          _notify();
          gotoNextQuestion();
        } else {
          timerStart--;
          _notify();
        }
      },
    );
  }

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  getQuestions() async {
    questions = await DatabaseHelper.instance
        .getRandomQuestionsWithOptions(await DatabaseHelper.instance.database);
    _notify();
    startQuestionTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topView(),
            const SizedBox(height: 24),
            QuestionOptionsView(
              questionDetails: questions[currentQuestionIndex],
              groupValue: selectedOptionIndex,
              onChanged: (value) {
                selectedOptionIndex = value!;
                selectedOption =
                    questions[currentQuestionIndex].options![value];
                _notify();
              },
            ),
            const SizedBox(height: 24),
            buttonView(),
          ],
        ),
      ),
    );
  }

  Widget topView() {
    return Row(
      children: [
        TopItemView(
          title: "Score",
          text: score.toString(),
          subText: "",
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        const Spacer(),
        TopItemView(
          title: "Question",
          text: (currentQuestionIndex + 1).toString(),
          subText: " / $totalQuestions",
        ),
        const Spacer(),
        TopItemView(
          title: "Timer",
          text: timerStart.toString(),
          subText: "s",
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  Widget buttonView() {
    return Row(
      children: [
        const Spacer(),
        FilledButton(
          onPressed: selectedOption == null
              ? null
              : () async {
                  gotoNextQuestion();
                },
          style: ButtonStyle(
            backgroundColor: buttonBgColor,
          ),
          child: const Text("Check & Continue"),
        ),
      ],
    );
  }

  gotoNextQuestion() {
    // set button color
    if (selectedOption == null) {
      setWrongAnswerColor();
    } else {
      if (selectedOption!.isAnswer == 1) {
        // update score
        score = (score + correctAnswerMarks) + timerStart;
        correctAnswers++;
        setCorrectAnswerColor();
      } else {
        setWrongAnswerColor();
      }
    }
    // cancel active timer
    if (timer!.isActive) {
      timer!.cancel();
      _notify();
    }
    Timer(const Duration(seconds: 1), () {
      if (currentQuestionIndex == (questions.length - 1)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              correctAnswers: correctAnswers,
            ),
          ),
        );
      } else {
        currentQuestionIndex++;
        selectedOption = null;
        selectedOptionIndex = -1;
        buttonBgColor = null;
        startQuestionTimer();
      }
    });
  }

  setCorrectAnswerColor() {
    buttonBgColor = MaterialStateProperty.all(Colors.green);
    _notify();
  }

  setWrongAnswerColor() {
    buttonBgColor = MaterialStateProperty.all(Colors.redAccent);
    _notify();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  _notify() {
    if (mounted) setState(() {});
  }
}
