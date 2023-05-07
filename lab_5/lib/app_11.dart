import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

import 'menu.dart';

class App11 extends StatefulWidget {
  App11({Key? key}) : super(key: key);

  @override
  State<App11> createState() => _App11State();
}

class _App11State extends State<App11> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text("add")
            ),
            ElevatedButton(
                onPressed: _resetCounter,
                child: const Text("reset")
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}