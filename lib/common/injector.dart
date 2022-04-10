import 'package:flutter_travel_ui/data/datasource/local/task_data_provider.dart';
import 'package:flutter_travel_ui/data/repository/task_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // data provider
  getIt.registerSingleton<TaskLocalDatabase>(TaskLocalDatabase());
  //repository
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepository());

}