import 'package:flutter/material.dart';

import '../data/constants.dart';
import '../data/questionData.dart';
import '../data/questionModel.dart';

class HistoryPage extends StatelessWidget {
  final QuestionData questionData;
  const HistoryPage({
    super.key,
    required this.questionData,
  });

  List<Widget> getQiuzeList(List list) {
    List<Text> items = [];

    for (int i = 0; i < list.length; i++) {
      var newItem = Text(
        'Qustions ${i + 1}',
        style: kHistoryTextStyle,
      );
      items.add(newItem);
    }
    return items;
  }

  List<Icon> getIconList(List list) {
    List<Icon> items = [];

    for (QuestionModel listValue in list) {
      var newItem = listValue.answerIcon;
      items.add(newItem);
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Answer'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getIconList(questionData.getQuestiontList()),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getQiuzeList(questionData.getQuestiontList()),
            ),
          ],
        ),
      ),
    );
  }
}
