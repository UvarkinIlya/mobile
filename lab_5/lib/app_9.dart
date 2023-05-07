import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

import 'menu.dart';

class App9 extends StatefulWidget {
  const App9({Key? key}) : super(key: key);

  @override
  State<App9> createState() => _App9State();
}

class _App9State extends State<App9> {
  late int _index = 0;

  var items = ["First", "Second", "Third"];

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: const Text("App 9"),
        actions: const [
          BackdropToggleButton(icon: AnimatedIcons.list_view)
        ],
      ),
      //frontLayer: Text("Item:${items[_index]} Index:$_index"),
      frontLayer: Center(
        child: Text("Item:${items[_index]} Index:$_index"),
      ),
      backLayer: BackdropNavigationBackLayer(
        items: const [
          ListTile(title: Text("First"),),
          ListTile(title: Text("Second"),),
          ListTile(title: Text("Third"),),
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.account_tree_outlined),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    setState(() {
                      _index = index;
                    });
                  },
                ),
              )),

        ),
        label: const Text('Show'),
      ),
    );
  }
}