import 'package:equatable/equatable.dart';

enum NewTaskStatus { initial, loading, success, failure }

class NewTaskState extends Equatable {
  const NewTaskState(
      {this.status = NewTaskStatus.initial,
      this.topic = "",
      this.title = "",
      this.description = ""});

  final NewTaskStatus status;
  final String topic;
  final String title;
  final String description;

  NewTaskState copyWith({NewTaskStatus? status,String? topic, String? title, String? description}) {
    return NewTaskState(
      status: status ?? this.status,
      topic:  topic ?? this.topic,
      title:  title ?? this.title,
      description:  description ?? this.description
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,topic,title,description];
}
