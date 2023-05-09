import 'package:flutter/material.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("lab 8"),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "/app_1",
              child: Text("app 1"),
            ),
            const PopupMenuItem(
              value: "/app_2",
              child: Text("app 2"),
            ),
          ],
          onSelected: (String path) {
            Navigator.pushNamed(context, path.toString());
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}