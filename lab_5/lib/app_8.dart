import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

import 'menu.dart';

class App8 extends StatelessWidget {
  const App8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                    tabs: [
                      Tab(text: "Task 1",),
                      Tab(text: "Task 2",),
                      Tab(text: "Task 3",),
                    ]
                ),
              ),
              body: const TabBarView(
                  children: [
                    Center(child: Text("some text 1"),),
                    Center(child: Text("some text 2"),),
                    Center(child: Text("some text 3"),),
                  ]
              )
          )),
    );
  }
}