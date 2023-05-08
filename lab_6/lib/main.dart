import 'package:flutter/material.dart';

import 'app_1.dart';
import 'app_2.dart';
import 'app_3.dart';
import 'app_4.dart';
import 'app_5.dart';

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
      home: App1(),
      initialRoute: "/",
      routes: {
        "/app_1": (context) => App1(),
        "/app_2": (context) => const App2(),
        "/app_3": (context) => App3(),
        "/app_4": (context) => App4(),
        "/app_5": (context) => App5(),
      },
    );
  }
}

