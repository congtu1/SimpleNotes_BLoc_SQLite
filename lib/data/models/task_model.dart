import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class Task {
  final int id;
  final String? topic;
  final String? title;
  final String? description;
  Task(this.id, this.topic, this.title, this.description);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

}
