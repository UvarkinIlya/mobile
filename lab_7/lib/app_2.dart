import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_7/menu.dart';

import 'menu.dart';

class App2 extends StatefulWidget {
  App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animationPosition;
  late Animation<double> animationAngle;
  late Animation<Color?> animationColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);

    animationColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller)..addListener(() {
      setState(() {});
    });

    animationPosition = Tween(begin: 0.0, end: 400.0).animate(controller)..addListener(() {
      setState(() {

      });
    });

    animationAngle = Tween(begin: 0.0, end: pi).animate(controller)..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Transform.translate(
        offset: Offset(100, animationPosition.value),
        child: Transform.rotate(
          angle: animationAngle.value,
          child: SizedBox(
          width: 200,
          height: 100,

          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: animationColor.value,
            ),
            onPressed: () {  },
            child: GestureDetector(
              onTapDown: (details) => changeState(),
              onTapUp: (details) => stopAnimate(),
              child: Text("Hello world!", style: TextStyle(fontSize: 28),),
            )

          ),
        ),
      )
      ),
    );
  }

  void changeState(){
    controller.forward();
  }

  void stopAnimate(){
    controller.reverse();
  }
}

