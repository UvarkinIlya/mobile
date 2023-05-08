import 'package:flutter/material.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("lab 7"),
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
            const PopupMenuItem(
              value: "/app_3",
              child: Text("app 3"),
            ),
            const PopupMenuItem(
              value: "/app_4",
              child: Text("app 4"),
            ),
            const PopupMenuItem(
              value: "/app_5",
              child: Text("app 5"),
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