import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  DateTime createdAtDate;

  @HiveField(4)
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.createdAtDate,
    required this.isCompleted,
  });

  factory TaskModel.fromEntity(Task task) => TaskModel(
        id: task.id ?? const Uuid().v1(),
        title: task.title ?? "",
        subtitle: task.subtitle ?? "",
        isCompleted: task.isCompleted ?? false,
        createdAtDate: task.createdAtDate ?? DateTime.now(),
      );

  Task toEntity() => Task(
        id: id,
        title: title,
        subtitle: subtitle,
        isCompleted: isCompleted,
        createdAtDate: createdAtDate,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        createdAtDate,
        isCompleted,
      ];
}
