import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qiuz_app_scutum/bloc/question_index_cubit.dart';
import 'package:qiuz_app_scutum/data/constants.dart';
import 'package:qiuz_app_scutum/data/questionData.dart';

import '../data/routes.dart';
import 'componets/roudedButton.dart';

class ResultPage extends StatefulWidget {
  final QuestionData questionData;
  const ResultPage({
    super.key,
    required this.questionData,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void restart() {
    widget.questionData.setDefaultIcons();
    Navigator.of(context).pushNamed(RouteId.welcome);
    context.read<QuestionCubit>().updateState(
          trueScore: 0,
          falseScore: 0,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<QuestionCubit, QuestionCubitState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('TRUE: ${state.trueScore}', style: kTrueTextStyle),
                    Text('FALSE: ${state.falseScore}', style: kFalseTextStyle),
                  ],
                );
              },
            ),
            Column(
              children: [
                RoudedButton(
                  title: 'RESTART',
                  onPressed: () {
                    restart();
                  },
                ),
                RoudedButton(
                  title: 'View histore answer',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteId.history,
                      arguments: questionData,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
