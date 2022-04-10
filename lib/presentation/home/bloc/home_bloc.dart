
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_ui/common/injector.dart';
import 'package:flutter_travel_ui/data/models/task_model.dart';
import 'package:flutter_travel_ui/data/repository/task_repository.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetched>(_onHomeFetched);
    on<HomeRemoveItem>(_onHomeRemoveItem);
  }

  final taskRepository = getIt.get<TaskRepository>();
  Future<void> _onHomeFetched(
      HomeFetched event, Emitter<HomeState> emit) async {
    await emit.forEach<List<Task>>(taskRepository.getTasks(),
        onData: (tasks) =>
            state.copyWith(status: HomeStatus.success, task: tasks),
        onError: (oj,st) => state.copyWith(status: HomeStatus.failure));
  }

  Future<void> _onHomeRemoveItem(
    HomeRemoveItem event,
    Emitter<HomeState> emit,
  ) async {
    await taskRepository.deleteTask(event.id);
    emit(state.copyWith(hasFetch: true));
  }
}
