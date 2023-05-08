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
      home: App5(),
    );
  }
}

class RectModel{
  final String _text;

  RectModel(this._text);

  String get text => _text;
}

class App5 extends StatefulWidget {
  App5({Key? key}) : super(key: key);

  @override
  State<App5> createState() => _App5State();
}

class _App5State extends State<App5> {
  var _controller = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String text_config;
  late bool bool_config;
  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      text_config = prefs.getString("text_config") ?? "";
      bool_config = prefs.getBool("bool_config") ?? false;
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
              TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty){
                    _prefs.then((prefs) {
                      prefs.setString("text_config", value);
                      text_config = value;
                      setState(() {});
                    });
                  }
                },
              ),
              Switch(
                  value: bool_config,
                  onChanged: (value) {
                    _prefs.then((prefs) {
                      prefs.setBool("bool_config", value);
                      bool_config = value;
                      setState(() {});
                    });
                  },
              ),
              Text("Config Text: $text_config")
            ]
        ),
      ),
    );
  }
}

