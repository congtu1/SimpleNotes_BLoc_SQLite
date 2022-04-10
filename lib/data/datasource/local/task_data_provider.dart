
import 'dart:io';

import 'package:flutter_travel_ui/data/models/task_model.dart';
import 'package:path/path.dart';
import 'package:rxdart/subjects.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class TaskLocalDatabase {
  TaskLocalDatabase() {
    _init();
  }

  Database? _database;
  final _taskStreamController = BehaviorSubject<List<Task>>.seeded(const []);
  Stream<List<Task>> getTasks() => _taskStreamController.asBroadcastStream();

  void _init() async {
    final tasks = await fetchAllTask();
    _taskStreamController.add(tasks);
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await getDatabaseInstance();
    return _database;
  }
  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "TASKDATABASE.db");
    return await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Task(id INTEGER PRIMARY KEY AUTOINCREMENT,topic TEXT,title TEXT,description TEXT)');
      },
    );
  }
/// add new task
  Future<void> newTask(Map<String, String> task) async {
    final db = await database;
    await db!.insert("Task", task,conflictAlgorithm: ConflictAlgorithm.replace).then((value) async {
     _init();
    });
  }

  //get all task
Future<List<Task>> fetchAllTask() async {
  final db = await database;
  var response = await db!.query("Task",);
  List<Task> list = response.isNotEmpty
      ? response.map((e) => Task.fromJson(e)).toList()
      : [];
  print("provider task:"+list.toString());
  return list;
}
  Future<void> deleteTaskWithId(int id) async {
    final tasks = [..._taskStreamController.value];
    final taskIndex = tasks.indexWhere((t) => t.id == id);
    if(taskIndex == -1) {
      throw Exception();
    }
    else {
      final db = await database;
      await db!.delete("Task", where: "id= ?", whereArgs: [id]);
      tasks.removeAt(taskIndex);
      _taskStreamController.add(tasks);
    }

  }

}