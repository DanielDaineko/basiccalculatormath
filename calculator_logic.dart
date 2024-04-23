import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  double _buffer = 0.0;
  String _currentOperator = '';
  String currentExpression = '';

  String processInput(String input) {
    if (input == 'C') {
      _clear();
    } else if (input == '=') {
      currentExpression += _buffer.toString();
      currentExpression = currentExpression.replaceAll('×', '*').replaceAll('÷', '/');
      double result = _calculateResult(currentExpression);
      _clear();
      _buffer = result;
      currentExpression = '';
    } else if (_isOperator(input)) {
      _handleOperator(input);
    } else {
      _appendToBuffer(input);
      currentExpression += input;
    }

    return _formatOutput(_buffer);
  }

  bool _isOperator(String value) {
    return ['+', '-', '×', '÷'].contains(value);
  }

  void _appendToBuffer(String value) {
    if (_buffer == 0.0) {
      _buffer = double.parse(value);
    } else {
      _buffer = double.parse('$_buffer$value');
    }
  }

  void _handleOperator(String operator) {
    if (_currentOperator.isNotEmpty) {
      currentExpression = currentExpression.substring(0, currentExpression.length - 1) + operator;
    } else {
      currentExpression += operator;
    }

    _currentOperator = operator;
    _buffer = 0.0;
  }

  double _calculateResult(String expression) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      return exp.evaluate(EvaluationType.REAL, contextModel);
    } catch (e) {
      print('Error evaluating expression: $e');
      return 0.0;
    }
  }

  void _clear() {
    _buffer = 0.0;
    _currentOperator = '';
    currentExpression = '';
  }

  String _formatOutput(double value) {
    String formattedOutput = value.toStringAsFixed(2);
    if (formattedOutput.endsWith('.00')) {
      return value.toInt().toString();
    }
    return formattedOutput;
  }

  void clear() {}
}
