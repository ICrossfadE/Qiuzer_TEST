import 'package:flutter/material.dart';
import '../bloc/question_index_cubit.dart';
import 'questionModel.dart';

class QuestionData {
  final QuestionCubit questionCubit;

  int _questionIndex = 0;

  QuestionData(this.questionCubit);

  final List<QuestionModel> _questions = [
    QuestionModel(
        questionAnswer: true,
        questionText: 'The Pacific Ocean is the largest ocean on Earth.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: false,
        questionText: 'There are 30 hours in a day.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText: 'Venus is the hottest planet in our solar system.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: false,
        questionText: 'An octopus has five hearts.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText:
            'The Amazon rainforest produces 20% of the world\'s oxygen.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText: 'The Great Wall of China is visible from space.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText: 'Sharks are immune to all known diseases.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText: 'Bananas are berries.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: false,
        questionText: 'Goldfish have a three-second memory span.',
        answerIcon: const Icon(Icons.panorama_fish_eye)),
    QuestionModel(
        questionAnswer: true,
        questionText: 'The Eiffel Tower can be 15 cm taller during the summer.',
        answerIcon: const Icon(Icons.panorama_fish_eye))
  ];

  List<QuestionModel> getQuestiontList() {
    return _questions;
  }

  String getQuestion() {
    return _questions[_questionIndex].questionText;
  }

  bool getAnswer() {
    return _questions[_questionIndex].questionAnswer;
  }

  int getIndex() {
    return _questionIndex;
  }

  int getQuestionLenght() {
    return _questions.length;
  }

  void updateIndex(int index) {
    _questionIndex = index;
    questionCubit.updateState(index: _questionIndex);
  }

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    } else {
      _questionIndex = 0;
    }
    questionCubit.updateState(index: _questionIndex);
  }

  void updateAnswerIcon(int index, Icon newIcon) {
    _questions[_questionIndex].answerIcon = newIcon;
  }

  void setDefaultIcons() {
    for (QuestionModel listValue in _questions) {
      listValue.answerIcon = const Icon(Icons.panorama_fish_eye);
    }
  }

  void trueScore() {
    questionCubit.incrementTrueScore();
  }

  void falseScore() {
    questionCubit.incrementFalseScore();
  }
}
