import 'package:flutter/material.dart';

import 'data/routes.dart';

class AppViev extends StatelessWidget {
  const AppViev({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: RouteId.welcome,
    );
  }
}
