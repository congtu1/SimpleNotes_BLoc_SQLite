import 'package:equatable/equatable.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_state.dart';

abstract class HomeEvent  extends Equatable{}
class HomeFetched extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class HomeRemoveItem extends HomeEvent{
  HomeRemoveItem({required this.id});
  final int id;
  List<Object?> get props => [id];
}

