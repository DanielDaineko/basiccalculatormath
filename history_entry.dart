import 'package:flutter/foundation.dart';

class HistoryEntry {
  final String expression;
  final double result;
  final DateTime timestamp;

  HistoryEntry({
    required this.expression,
    required this.result,
    required this.timestamp,
  });

  // Метод для конвертации объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'expression': expression,
      'result': result,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Фабричный метод для создания объекта из JSON
  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      expression: json['expression'],
      result: json['result'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
