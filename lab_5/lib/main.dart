import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageWithNumber(pageNumber: 0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PageWithNumber extends StatefulWidget {
  PageWithNumber({Key? key, required this.pageNumber}) : super(key: key);

  int pageNumber = 0;

  @override
  State<PageWithNumber> createState() => _PageWithNumberState();
}

class _PageWithNumberState extends State<PageWithNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageWithNumber(pageNumber: widget.pageNumber+1),))
              },
              child: const Text("forward"),
            ),
            ElevatedButton(
              onPressed: () => {
                if (widget.pageNumber > 0) {
                  Navigator.pop(context)
                }
              },
              child: const Text("back"),
            ),
            Text(widget.pageNumber.toString()),
          ],
        ),
      ),
    );
  }
}



