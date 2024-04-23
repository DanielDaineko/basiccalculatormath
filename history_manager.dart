import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_entry.dart';

class HistoryManager {
  static const _historyKey = 'calculator_history';

  // Метод для получения истории из хранилища
  Future<List<HistoryEntry>> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyJson = prefs.getStringList(_historyKey);
    if (historyJson == null) return [];
    return historyJson.map((json) => HistoryEntry.fromJson(jsonDecode(json))).toList();
  }

  // Метод для добавления записи в историю
  Future<void> addToHistory(String expression, double result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyJson = prefs.getStringList(_historyKey) ?? [];
    historyJson.add(jsonEncode(HistoryEntry(
      expression: expression,
      result: result,
      timestamp: DateTime.now(),
    ).toJson()));
    await prefs.setStringList(_historyKey, historyJson);
  }
}
