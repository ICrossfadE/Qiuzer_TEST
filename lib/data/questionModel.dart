import 'package:flutter/material.dart';

class QuestionModel {
  late String questionText;
  late bool questionAnswer;
  late Icon answerIcon;

  QuestionModel({
    required this.questionAnswer,
    required this.questionText,
    required this.answerIcon,
  });

  // getIcon() {}
}
