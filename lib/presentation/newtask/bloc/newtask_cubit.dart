
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_ui/common/injector.dart';
import 'package:flutter_travel_ui/data/repository/task_repository.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_travel_ui/presentation/newtask/bloc/newtask_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(const NewTaskState());

  final taskRepository = getIt.get<TaskRepository>();
  void topicChanged(String topics) {
    print(state.topic.toString());
    emit(state.copyWith(topic: topics));
  }
  void titleChanged(String t) {
    print(state.title.toString());
    emit(state.copyWith(title: t));
  }
  void descriptionChanged(String des) {
    print(state.description.toString());
    emit(state.copyWith(description: des));
  }

  void submit() async {
    Map<String,String> task = {
      "topic": state.topic,
      "title":state.title,
      "description":state.description
    };
    print(task.toString());
    try {
      emit(state.copyWith(status: NewTaskStatus.loading));
      await taskRepository.newTask(task);
      emit(state.copyWith(status: NewTaskStatus.success));
    }
    catch(e) {
      emit(state.copyWith(status: NewTaskStatus.failure));
    }
  }
}