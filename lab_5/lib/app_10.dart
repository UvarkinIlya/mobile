import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

import 'menu.dart';

class App10 extends StatelessWidget {
  App10({Key? key}) : super(key: key);

  var items = ['First', 'Second', 'Third'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App 10"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => print("Item:${items[int.parse(value)]} Index:$value"),
            itemBuilder: (context) => items.map((item) => PopupMenuItem<String>(value: items.indexOf(item).toString(), child: Text(item),)).toList()
          )
        ],
      ),
    );
  }
}