import 'package:flutter/material.dart';
import 'package:lab_7/menu.dart';

class PageWithNumber extends StatelessWidget {
  PageWithNumber({Key? key, required this.pageNumber}) : super(key: key);

  int pageNumber = 0;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageWithNumber(pageNumber: pageNumber+1),))
              },
              child: const Text("forward"),
            ),
            ElevatedButton(
              onPressed: () => {
                if (pageNumber > 0) {
                  Navigator.pop(context)
                }
              },
              child: const Text("back"),
            ),
            Text(pageNumber.toString()),
          ],
        ),
      ),
    );
  }
}
