import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  CalculatorButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(text);
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}