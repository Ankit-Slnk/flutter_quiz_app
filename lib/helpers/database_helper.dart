import 'package:quizapp/data/quiz_data.dart';
import 'package:quizapp/helpers/utility.dart';
import 'package:quizapp/models/option_details.dart';
import 'package:quizapp/models/question_details.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "quizApp.db";
  static const _databaseVersion = 1;

  // common fields
  static const idColumn = 'id';

  // questions table
  static const questionsTable = 'questions';
  // fields
  static const questionColumn = 'question';

  // options table
  static const optionsTable = 'options';
  // fields
  static const questionIdColumn = 'questionId';
  static const optionColumn = 'option';
  static const isAnswerColumn = 'isAnswer'; // 1 - true | 0 - false

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await createQuestionsTable(db);
        await createOpionsTable(db);
        await insertAllData(db);
      },
    );
  }

  // creates questions table
  Future createQuestionsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $questionsTable (
          $idColumn INTEGER PRIMARY KEY,
          $questionColumn TEXT NOT NULL
        )
        ''');
  }

  // creates options table
  Future createOpionsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $optionsTable (
          $idColumn INTEGER PRIMARY KEY,
          $questionIdColumn INTEGER NOT NULL,
          $optionColumn TEXT NOT NULL,
          $isAnswerColumn INTEGER NOT NULL
        )
        ''');
  }

  // insert all quiz data
  Future insertAllData(Database db) async {
    for (var question in quizData) {
      int questionId = await db.insert(
        questionsTable,
        QuestionDetails(
          question: question.question,
        ).toJson(),
      );
      for (var option in question.options!) {
        await db.insert(
          optionsTable,
          OptionDetails(
            option: option.option,
            isAnswer: option.isAnswer,
            questionId: questionId,
          ).toJson(),
        );
      }
    }
  }

  // get 10 random questions
  // get 2 wrong random options and one correct option
  Future<List<QuestionDetails>> getRandomQuestionsWithOptions(
      Database db) async {
    // get random questions data
    List<QuestionDetails> questionsList = (await db.rawQuery(
            "select * from $questionsTable order by RANDOM() LIMIT $totalQuestions"))
        .map((e) => QuestionDetails.fromJson(e))
        .toList();
    for (var question in questionsList) {
      List<OptionDetails> allOptions = [];
      // get 2 random wrong options
      List<OptionDetails> wrongOptionsList = (await db.rawQuery(
              "select * from $optionsTable where $isAnswerColumn LIKE 0 AND $questionIdColumn LIKE ${question.id} order by RANDOM() LIMIT 2"))
          .map((e) => OptionDetails.fromJson(e))
          .toList();
      // get 1 correct option
      List<OptionDetails> answerOptionsList = (await db.rawQuery(
              "select * from $optionsTable where $isAnswerColumn LIKE 1 AND $questionIdColumn LIKE ${question.id}"))
          .map((e) => OptionDetails.fromJson(e))
          .toList();
      allOptions = wrongOptionsList + answerOptionsList;
      allOptions.shuffle();
      question.options = allOptions;
    }
    return questionsList;
  }
}
