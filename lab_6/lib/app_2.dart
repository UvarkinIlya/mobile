import 'package:flutter/material.dart';

import 'menu.dart';

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
      home: App2(),
    );
  }
}

class RectModel{
  final int _number;

  RectModel(this._number);

  int get number => _number;
}

class App2 extends StatefulWidget {
  const App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {
  var rectModels = [];
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rectModels.add(RectModel(_counter++));
                      });
                    },
                    child: const Icon(
                      Icons.add,
                    )
                ),
              ),
              ListView.builder(
                itemCount: rectModels.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: ListTile(
                    title: Text(rectModels[index].number.toString()),
                    onTap: () {
                      setState(() {
                        rectModels.removeAt(index);
                      });
                    },
                  ),
                )
              ),
            ]
        ),
      ),
    );
  }
}

