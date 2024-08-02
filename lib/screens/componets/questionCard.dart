import 'package:flutter/material.dart';
import 'package:qiuz_app_scutum/data/constants.dart';

class QuestionCard extends StatelessWidget {
  final String qustionText;

  const QuestionCard({super.key, required this.qustionText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          decoration: kCardDecoration,
          child: Center(
            child: Text(
              qustionText,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
