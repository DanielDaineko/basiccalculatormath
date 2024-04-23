import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'converter_screen.dart';
import 'themes.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorScreen(),
        '/converter': (context) => ConverterScreen(),
      },
    );
  }
}
