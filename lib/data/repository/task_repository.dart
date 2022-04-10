
import 'package:flutter_travel_ui/common/injector.dart';
import 'package:flutter_travel_ui/data/datasource/local/task_data_provider.dart';
import 'package:flutter_travel_ui/data/models/task_model.dart';

class TaskRepository {

  final _data = getIt.get<TaskLocalDatabase>();

 Stream<List<Task>> getTasks() => _data.getTasks();

  Future<void> newTask(Map<String, String> task) {
    return _data.newTask(task);
  }
  Future<void> deleteTask(int id) async{
    return _data.deleteTaskWithId(id);
  }
}