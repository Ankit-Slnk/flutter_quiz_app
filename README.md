# Quiz App

Make simple quiz app using local database.

Screens 1:

1. Put ​Play Game​ button in the middle of the screen. 
2. On tap of it redirect user to screen 2 where he can play quiz game.

Screen 2 :

1. Fetch random 10 questions from local database and display one by one.
2. Time for each question is 20 seconds.
3. If user don’t give answer within 20 seconds then next question will be displayed.
4. Store 4 Options on Database but show 3 options (1 Correct and 2 Random incorrect
options) only.
5. Score Calculation Logic
    * For Correct Answer : 10 + (20 Seconds - Seconds in which user given answer) For e.g if user give answer in 5 seconds then score is 10 + (20 - 5) = 25
    * For Wrong Answer or Un-attempted question score is 0
6. Show Total score at the top left side and timer on top right side.
7. Button color should be changed to Green and Red for correct and wrong answer
respectively.
8. Timer, Question No and Score should be show on top.

Screen 3 :

1. Show Total Score and Win or Lose Message.
2. 
    * If 5 answers are correct then show message ​You Won!
    * If 7 answers are correct then show message ​You Won! Congratulations.
    * If 9 answers are correct then show message ​You Won! Congratulations and Well Done.
    * If all 10 answers are correct then show message ​Awesome. You are Genius. Congratulations you won the Game.
    * If 0, 1 or 2 answers are correct then show message ​Sorry, You failed.
    * If 3 or 4 answers are correct then show message ​Well played but you failed. All The Best for Next Game.
3. Put Play Again Button at the Bottom.