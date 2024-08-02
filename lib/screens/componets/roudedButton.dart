import 'package:flutter/material.dart';

class RoudedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  const RoudedButton(
      {super.key, required this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
      child: Text(title),
    );
  }
}
