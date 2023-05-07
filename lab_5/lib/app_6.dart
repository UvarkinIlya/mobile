import 'package:flutter/material.dart';
import 'package:lab_5/menu.dart';
import 'package:collection/collection.dart';

class Task{
  late final String _text;
  late final DateTime _dateTime;

  Task(this._text, this._dateTime);

  DateTime get dateTime => _dateTime;
  String get text => _text;
}

class App6 extends StatefulWidget {
  const App6({Key? key}) : super(key: key);

  @override
  State<App6> createState() => _App6State();
}

class _App6State extends State<App6> {
  List<Task> tasks = [
    Task("Сделать дело", DateTime(2017, 02, 17)),
    Task("Гулять смело", DateTime(2017, 02, 17)),
    Task("Прочитать книгу", DateTime(2017, 02, 16)),
    Task("Сходить на учебу", DateTime(2017, 02, 15)),
  ];

  @override
  Widget build(BuildContext context) {
    var groupTasks = groupBy(tasks, (task) => task.dateTime,);

    return Scaffold(
      appBar: const Menu(),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            var key = groupTasks.keys.elementAt(index);
            var title = groupTasks.keys.elementAt(index);
            return ExpansionTile(
              title: Text(getDate(title.year, title.month, title.day)),
              children: groupTasks[key]!.map((task) => ListTile(title: Text(task.text), subtitle: Text(getDate(task.dateTime.year, task.dateTime.month, task.dateTime.day)),)).toList(),
            );
          },
          itemCount: groupTasks.length,
        ),
      ),
    );
  }

  String getDate(int year, int month, int day){
    String date = '$year.';
    if (month <= 9){
      date += "0";
    }
    date += '$month.';

    if (day <= 9){
      date += "0";
    }
    date += '$day';

    return date;
  }
}
