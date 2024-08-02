import 'package:flutter/material.dart';

import '../data/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        child: const Text('Start Qiuz'),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RouteId.questions,
            arguments: questionData,
          );
        },
      ),
    );
  }
}
