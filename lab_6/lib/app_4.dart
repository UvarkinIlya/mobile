import 'package:flutter/material.dart';
import 'package:lab_6/menu.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      home: App4(),
    );
  }
}

class RectModel{
  final String _text;

  RectModel(this._text);

  String get text => _text;
}

class Note {
  int? id;
  final String note;
  
  Note(this.note);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
    };
  }



  @override
  String toString() {
    return 'Note{id: $id, note: $note}';
  }
}

class App4 extends StatefulWidget {
  App4({Key? key}) : super(key: key);

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  var _controller = TextEditingController();
  var dbPath = "";
  var database;

  late List<Note> _nodes = <Note>[];
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    getDatabasesPath().then((value) => dbPath = value);
    database = openDatabase(
      join(dbPath, 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE notes(id INTEGER PRIMARY KEY, note TEXT)');
      },
      version: 1,
    );

    notes().then((value) => _nodes = value);
    _controller = TextEditingController();
  }
  
  Future<void> insertNote(Note note) async {
    final db = await database;
    
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> notes() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return Note(
        maps[i]['note']
        //id: maps[i]['id'],
        //note: maps[i]['note'],
      );
    });
  }

  Future<void> deleteNote(String note) async {
    final db = await database;

    await db.delete(
      'notes',
      where: 'note = ?',
      whereArgs: [note],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child: Column(
            children:[
              ListView.builder(
                itemCount: _nodes.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => TextButton(
                  // height: 100,
                  // width: 100,
                  onPressed: () {
                    deleteNote(_nodes[index].note).then((value) {
                      notes().then((value){
                        _nodes = value;
                        setState(() {});
                      });
                    });
                  },
                  child: Center(
                    child: Text(
                      _nodes[index].note,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("add note"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _controller,
                )
              ],
            ),
            actions:<Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty){
                    insertNote(Note(_controller.text)).then((v){
                      notes().then((value) => _nodes = value);
                      setState(() {});
                    });
                  }

                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

