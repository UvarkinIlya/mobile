import 'package:flutter/material.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: const Text("lab 5"),
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
            const PopupMenuItem(
              value: "/app_6",
              child: Text("app 6"),
            ),
            const PopupMenuItem(
              value: "/app_7",
              child: Text("app 7"),
            ),
            const PopupMenuItem(
              value: "/app_8",
              child: Text("app 8"),
            ),
            const PopupMenuItem(
              value: "/app_9",
              child: Text("app 9"),
            ),
            const PopupMenuItem(
              value: "/app_10",
              child: Text("app 10"),
            ),
            const PopupMenuItem(
              value: "/app_11",
              child: Text("app 11"),
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