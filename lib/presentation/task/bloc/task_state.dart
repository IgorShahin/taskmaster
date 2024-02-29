part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  final List<Task>? tasks;

  const TaskState({this.tasks});

  @override
  List<Object> get props => [tasks!];
}

class TaskLoadingState extends TaskState {
  const TaskLoadingState();
}

class TaskDoneState extends TaskState {
  const TaskDoneState(List<Task> tasks) : super(tasks: tasks);
}

class TaskEmptyState extends TaskState {
  const TaskEmptyState();
}
