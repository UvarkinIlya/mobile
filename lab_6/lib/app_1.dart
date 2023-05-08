import 'package:flutter/material.dart';
import 'package:lab_6/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App1(),
    );
  }
}

class RectModel{
  final String _text;
  final Color _color;

  RectModel(this._text, this._color);

  Color get color => _color;
  String get text => _text;
}

class App1 extends StatelessWidget {
  App1({Key? key}) : super(key: key);

  var rectModels = [
    RectModel("White", Colors.white),
    RectModel("Blue", Colors.blue),
    RectModel("Green", Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child: Column(
            children:[
              ListView.builder(
                itemCount: rectModels.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  color: rectModels[index].color,
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      rectModels[index].text,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

