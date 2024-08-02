import 'package:flutter/material.dart';
import 'package:qiuz_app_scutum/bloc/question_index_cubit.dart';
import 'package:qiuz_app_scutum/data/questionData.dart';
import 'package:qiuz_app_scutum/screens/HistoryPage.dart';
import 'package:qiuz_app_scutum/screens/QuestionsPage.dart';
import 'package:qiuz_app_scutum/screens/ResultPage.dart';
import 'package:qiuz_app_scutum/screens/WelcomePage.dart';

class RouteId {
  static const String welcome = '/';
  static const String result = '/result';
  static const String history = '/histore';
  static const String questions = '/questions';
}

QuestionCubit questionCubit = QuestionCubit();
QuestionData questionData = QuestionData(questionCubit);

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteId.history:
      final questionData = settings.arguments as QuestionData?;
      return MaterialPageRoute(
        builder: (context) => HistoryPage(
            questionData: questionData ?? QuestionData(questionCubit)),
      );
    case RouteId.result:
      final questionData = settings.arguments as QuestionData?;
      return MaterialPageRoute(
        builder: (context) => ResultPage(
            questionData: questionData ?? QuestionData(questionCubit)),
      );
    case RouteId.questions:
      final questionData = settings.arguments as QuestionData?;
      return MaterialPageRoute(
        builder: (context) => QuestionsPage(
            questionData: questionData ?? QuestionData(questionCubit)),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      );
  }
}
