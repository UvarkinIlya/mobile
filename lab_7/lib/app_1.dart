import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lab_7/menu.dart';

import 'menu.dart';

class App1 extends StatefulWidget {
  App1({Key? key}) : super(key: key);

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {
  late Timer _timer;
  int _seconds = 0;
  double _position = 0;

  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
      if (_seconds % 20 > 10 && _seconds % 20 <= 18){
        _position = 350;
      }

      _seconds++;
    });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            const TrafficLight(),
            AnimatedContainer(
              width: 400,
              height: 100,
              padding: EdgeInsets.only(right: 350, left: _position),
              duration: const Duration(seconds: 8,),
              child: const Icon(Icons.accessibility_new),
            ),
          ],
        )
      ),
    );
  }
}

class TrafficLight extends StatefulWidget {
  const TrafficLight({Key? key}) : super(key: key);

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {

  late Timer _timer;
  int _seconds = 0;

  Color _topColor = Colors.red;
  Color _middleColor = Colors.white;
  Color _bottomColor = Colors.white;
  double _position = 0;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _topColor = Colors.white;
        _middleColor = Colors.white;
        _bottomColor = Colors.white;

        if (_seconds % 20 <= 8){
          _topColor = Colors.red;
        } else if (_seconds % 20 <= 10){
          _middleColor = Colors.yellow;
        } else if (_seconds % 20 <= 18){
          _bottomColor = Colors.green;
          _position = 350;
        } else {
          _middleColor = Colors.yellow;
        }
      });


      _seconds++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          AnimatedContainer(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: _topColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2)
            ),
            duration: const Duration(milliseconds: 500),
          ),
          AnimatedContainer(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: _middleColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2)
            ),
            duration: const Duration(milliseconds: 500),
          ),
          AnimatedContainer(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: _bottomColor,
                shape: BoxShape.circle,
                border: Border.all(width: 2)
            ),
            duration: const Duration(milliseconds: 500,),
          ),
        ]
    );
  }
}

