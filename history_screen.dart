import 'package:flutter/material.dart';
import 'history_manager.dart';
import 'history_entry.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryManager historyManager = HistoryManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История расчетов'),
      ),
      body: FutureBuilder<List<HistoryEntry>>(
        future: historyManager.getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text('Ошибка при загрузке истории'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final entry = snapshot.data![index];
              return ListTile(
                title: Text('${entry.expression} = ${entry.result}'),
                subtitle: Text('${entry.timestamp.toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
