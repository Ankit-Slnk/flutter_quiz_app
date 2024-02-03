import 'package:quizapp/models/option_details.dart';

import '../models/question_details.dart';

// sample quiz questions
List<QuestionDetails> quizData = [
  QuestionDetails(
    question: "Who is the Prime Minister of India?",
    options: [
      OptionDetails(option: "Narendra Modi", isAnswer: 1),
      OptionDetails(option: "Rahul Gandhi"),
      OptionDetails(option: "Manmohan Singh"),
      OptionDetails(option: "Amit Shah")
    ],
  ),
  QuestionDetails(
    question: "What is the capital of India?",
    options: [
      OptionDetails(option: "Mumbai"),
      OptionDetails(option: "Chennai"),
      OptionDetails(option: "Delhi", isAnswer: 1),
      OptionDetails(option: "Ahmedabad"),
    ],
  ),
  QuestionDetails(
    question: "What is sum of 15 + 25 ?",
    options: [
      OptionDetails(option: "5"),
      OptionDetails(option: "25"),
      OptionDetails(option: "40", isAnswer: 1),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "Which one is maximum? 25,11,17,18,40,42",
    options: [
      OptionDetails(option: "11"),
      OptionDetails(option: "42", isAnswer: 1),
      OptionDetails(option: "17"),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "What is the official language of Gujarat?",
    options: [
      OptionDetails(option: "Hindi"),
      OptionDetails(option: "Gujarati", isAnswer: 1),
      OptionDetails(option: "Marathi"),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "What is multiplication of 12 * 12 ?",
    options: [
      OptionDetails(option: "124"),
      OptionDetails(option: "12"),
      OptionDetails(option: "24"),
      OptionDetails(option: "None", isAnswer: 1),
    ],
  ),
  QuestionDetails(
    question: "Which state of India has the largest population?",
    options: [
      OptionDetails(option: "UP", isAnswer: 1),
      OptionDetails(option: "Bihar"),
      OptionDetails(option: "Gujarat"),
      OptionDetails(option: "Maharashtra"),
    ],
  ),
  QuestionDetails(
    question: "Who is the Home Minister of India?",
    options: [
      OptionDetails(option: "Amit Shah", isAnswer: 1),
      OptionDetails(option: "Rajnath Singh"),
      OptionDetails(option: "Narendra Modi"),
      OptionDetails(option: "None")
    ],
  ),
  QuestionDetails(
    question: "What is the capital of Gujarat?",
    options: [
      OptionDetails(option: "Vadodara"),
      OptionDetails(option: "Ahmedabad"),
      OptionDetails(option: "Gandhinagar", isAnswer: 1),
      OptionDetails(option: "Rajkot"),
    ],
  ),
  QuestionDetails(
    question: "Which number will be next in series? 1, 4, 9, 16, 25",
    options: [
      OptionDetails(option: "21"),
      OptionDetails(option: "36", isAnswer: 1),
      OptionDetails(option: "49"),
      OptionDetails(option: "32"),
    ],
  ),
  QuestionDetails(
    question: "Which one is minimum? 5, 0, -20, 11",
    options: [
      OptionDetails(option: "0"),
      OptionDetails(option: "11"),
      OptionDetails(option: "-20", isAnswer: 1),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "What is sum of 10, 12 and 15?",
    options: [
      OptionDetails(option: "37", isAnswer: 1),
      OptionDetails(option: "25"),
      OptionDetails(option: "10"),
      OptionDetails(option: "12"),
    ],
  ),
  QuestionDetails(
    question: "What is the official language of the Government of India?",
    options: [
      OptionDetails(option: "Hindi", isAnswer: 1),
      OptionDetails(option: "English"),
      OptionDetails(option: "Gujarati"),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "Which country is located in Asia?",
    options: [
      OptionDetails(option: "India", isAnswer: 1),
      OptionDetails(option: "USA"),
      OptionDetails(option: "UK"),
      OptionDetails(option: "None"),
    ],
  ),
  QuestionDetails(
    question: "Which language(s) is/are used for Android app development?",
    options: [
      OptionDetails(option: "Java"),
      OptionDetails(option: "Java & Kotlin", isAnswer: 1),
      OptionDetails(option: "Kotlin"),
      OptionDetails(option: "Swift"),
    ],
  ),
];
