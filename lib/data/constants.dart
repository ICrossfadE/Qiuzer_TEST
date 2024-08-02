import 'package:flutter/material.dart';

const trueIcon = Icon(Icons.check, color: Colors.green);
const falseIcon = Icon(Icons.close, color: Colors.red);

final kCardDecoration = BoxDecoration(
  color: Colors.amber,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 5,
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
  ],
);

const kHistoryTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const kTrueTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green);
const kFalseTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
