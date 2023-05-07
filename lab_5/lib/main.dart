import 'package:flutter/material.dart';
import 'package:lab_5/app_1.dart';
import 'package:lab_5/app_2.dart';

import 'app_10.dart';
import 'app_11.dart';
import 'app_3.dart';
import 'app_4.dart';
import 'app_5.dart';
import 'app_6.dart';
import 'app_7.dart';
import 'app_8.dart';
import 'app_9.dart';

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
      initialRoute: "/",
      routes: {
        "/app_1": (context) => PageWithNumber(pageNumber: 0,),
        "/app_2": (context) => FirstPage(),
        "/app_3": (context) => AlertDialogWithText(),
        "/app_4": (context) => const Date(),
        "/app_5": (context) => const Time(),
        "/app_6": (context) => const App6(),
        "/app_7": (context) => const App7(),
        "/app_8": (context) => const App8(),
        "/app_9": (context) => const App9(),
        "/app_10": (context) => App10(),
        "/app_11": (context) => App11(),
      },
    );
  }
}

