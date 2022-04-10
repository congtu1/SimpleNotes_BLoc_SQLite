import 'package:equatable/equatable.dart';
import 'package:flutter_travel_ui/data/models/task_model.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.tasks = const <Task>[],
    this.hasFetch = false,
  });
  final HomeStatus status;
  final List<Task> tasks;
  final bool hasFetch;

  HomeState copyWith({HomeStatus? status,List<Task>? task, bool? hasFetch}) {
    return HomeState(
      status: status??this.status,
      tasks: task??this.tasks,
      hasFetch: hasFetch??this.hasFetch
    );
  }
  @override
  List<Object?> get props => [status,tasks,hasFetch];

  @override
  bool? get stringify => true;
}
