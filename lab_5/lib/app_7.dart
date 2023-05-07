import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

import 'menu.dart';

class App7 extends StatelessWidget {
  const App7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Menu(),
      body: Browser(
        initialUriString: 'https://flutter.dev/',
      ),
    );
  }
}