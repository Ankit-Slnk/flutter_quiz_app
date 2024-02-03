int totalQuestions = 10;
int totalSecPerQuestion = 20;
int correctAnswerMarks = 10;

// win/lose message according to number of correct answers
String getWinLoseMessage(int correctAnswers) {
  switch (correctAnswers) {
    case 0:
    case 1:
    case 2:
      return "Sorry, You failed";
    case 3:
    case 4:
      return "Well played but you failed. All The Best for Next Game.";
    case 5:
    case 6:
      return "You Won!";
    case 7:
    case 8:
      return "You Won! Congratulations.";
    case 9:
      return "You Won! Congratulations and Well Done.";
    case 10:
      return "Awesome. You are Genius. Congratulations you won the Game.";
    default:
      return "";
  }
}
