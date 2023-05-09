import 'package:flutter/material.dart';

import 'menu.dart';

class App2 extends StatelessWidget {
  const App2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _controller = TextEditingController();
  final _words = <String>[];

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _words.add(_controller.text.toLowerCase());
                  });
                },
                child: const Text("add")
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _words.removeLast();
                  });
                },
                child: const Text("delete")
            ),
            Text(wordsToString(_words)),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String wordsToString(List<String> words) {
    String str = "";

    for (int i = 0; i < _words.length -1; i++){
      str += "${_words[i]}, ";
    }

    if (_words.isNotEmpty){
      str += _words[_words.length -1];
    }

    return str;
  }
}
