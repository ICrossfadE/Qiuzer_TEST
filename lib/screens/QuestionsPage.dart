import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/question_index_cubit.dart';
import '../data/constants.dart';
import '../data/questionData.dart';
import '../data/routes.dart';
import 'componets/questionCard.dart';
import 'componets/roudedButton.dart';

class QuestionsPage extends StatefulWidget {
  final QuestionData questionData;

  const QuestionsPage({
    super.key,
    required this.questionData,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int quizIndex = 0;
  String questionText = '';

  @override
  void initState() {
    super.initState();
    quizIndex = context.read<QuestionCubit>().state.index;
    widget.questionData.updateIndex(quizIndex);
    questionText = widget.questionData.getQuestion();
  }

  void upfdateUI(bool typeAnswer) {
    resultAnswer(typeAnswer, quizIndex);

    setState(() {
      widget.questionData.nextQuestion();
      quizIndex = widget.questionData.getIndex();
      questionText = widget.questionData.getQuestion();
      widget.questionData.updateIndex(quizIndex);
      context.read<QuestionCubit>().updateState(index: quizIndex);
    });
  }

  void resultAnswer(bool answer, int index) {
    int questionLength = widget.questionData.getQuestionLenght();

    setState(() {
      if (widget.questionData.getAnswer() == answer) {
        widget.questionData.updateAnswerIcon(index, trueIcon);
        context.read<QuestionCubit>().incrementTrueScore();
      } else {
        widget.questionData.updateAnswerIcon(index, falseIcon);
        context.read<QuestionCubit>().incrementFalseScore();
      }
    });

    if (index + 1 >= questionLength) {
      Navigator.of(context)
          .pushNamed(RouteId.result, arguments: widget.questionData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionCubitState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Question ${quizIndex + 1}', style: kHistoryTextStyle),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: QuestionCard(
                      key: ValueKey<String>(
                          questionText), // Use a unique key to trigger animation
                      qustionText: questionText,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoudedButton(
                        title: 'FALSE',
                        color: Colors.red,
                        onPressed: () {
                          upfdateUI(false);
                        },
                      ),
                      RoudedButton(
                        title: 'TRUE',
                        color: Colors.green,
                        onPressed: () {
                          upfdateUI(true);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
