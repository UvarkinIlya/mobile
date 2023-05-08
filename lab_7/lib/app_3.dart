import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab_7/menu.dart';

import 'menu.dart';

class App3 extends StatefulWidget {
  App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            MyButton("Hello world!", Colors.deepOrange)
          ],
        )
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  String _text;
  Color _color;

  MyButton(this._text, this._color, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(_text, style: TextStyle(color: _color),));
  }
}


