import 'package:exam/Pages/CounterListPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(PatataBravaApp());

class PatataBravaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterListPage(),
    );
  }
}
