import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? id;
  String? title;
  String? subtitle;
  DateTime? createdAtDate;
  bool? isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.createdAtDate,
      required this.isCompleted});

  Task copyWith({
    String? id,
    String? title,
    String? subtitle,
    DateTime? createdAtTime,
    DateTime? createdAtDate,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      createdAtDate: createdAtDate ?? this.createdAtDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        createdAtDate,
        isCompleted,
      ];
}
