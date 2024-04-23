import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  double _kilometers = 0.0;
  double _miles = 0.0;

  void _convert() {
    setState(() {
      _miles = _kilometers * 0.621371;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kilometers to Miles Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilometers',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _kilometers = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Miles: $_miles',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
