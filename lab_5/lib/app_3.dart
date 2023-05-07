import 'package:flutter/material.dart';
import 'package:lab_5/menu.dart';

class AlertDialogWithText extends StatefulWidget {
  AlertDialogWithText({Key? key}) : super(key: key);

  @override
  State<AlertDialogWithText> createState() => _AlertDialogWithTextState();
}

class _AlertDialogWithTextState extends State<AlertDialogWithText> {
  late TextEditingController textEditingController;
  String _text = "TEXT";

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final alertText = (await openDialog(context));
                setState(() {
                  if (alertText != null) {
                    _text = alertText;
                  }
                });
              },
              child: const Text("open dialog"),
            ),
            Text(_text)
          ],
        ),
      ),
    );
  }

  Future<String?> openDialog(context) => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Input Text"),
        content: TextField(
          decoration: const InputDecoration(hintText: "Input some text"),
          controller: textEditingController,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, textEditingController.text.toString());
              },
              child: const Text("Submit")
          )
        ],
      ),
  );
}