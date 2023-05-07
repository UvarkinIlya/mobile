import 'package:flutter/material.dart';
import 'package:lab_5/menu.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  late SecondPage? secondPage;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                widget.secondPage = const SecondPage(),
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  widget.secondPage!))
              },
              child: const Text("Attach page"),
            ),
            ElevatedButton(
              onPressed: () => {
                widget.secondPage = null
              },
              child: const Text("Detach page"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.pop(context)
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

