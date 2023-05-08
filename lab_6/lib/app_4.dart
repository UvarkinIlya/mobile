import 'package:flutter/material.dart';
import 'package:lab_6/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: App4(),
    );
  }
}

class RectModel{
  final String _text;

  RectModel(this._text);

  String get text => _text;
}

class App4 extends StatefulWidget {
  App4({Key? key}) : super(key: key);

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  var _controller = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late List<String> _nodes = <String>[];
  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      _nodes = prefs.getStringList("notes")!;
      setState(() {});
    });

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child: Column(
            children:[
              ListView.builder(
                itemCount: _nodes.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      _nodes[index],
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("add note"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _controller,
                )
              ],
            ),
            actions:<Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty){
                    List<String>? nodes;
                    _prefs.then((prefs) {
                      var notes = prefs.getStringList("notes");
                      notes ??= [];
                      notes.add(_controller.text);

                      prefs.setStringList("notes", notes);
                      setState(() {
                        _nodes = notes!;
                      });
                    });
                  }

                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

