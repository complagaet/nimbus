import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Нажатий: $_counter", style: TextStyle(fontSize: 20)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('plus'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('reset'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _decrementCounter,
              child: Text('minus'),
            ),
          ],
        ),
      ],
    );
  }
}
