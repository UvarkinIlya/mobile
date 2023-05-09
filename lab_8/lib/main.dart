import 'package:flutter/material.dart';

import 'app_1.dart';
import 'app_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App1(),
      initialRoute: "/",
      routes: {
        "/app_1": (context) => App1(),
        "/app_2": (context) => App2(),
      },
    );
  }
}

