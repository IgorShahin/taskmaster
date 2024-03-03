part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  final Task? task;
  final String? idTask;
  final User? user;

  const TaskEvent({this.task, this.idTask, this.user});

  @override
  List<Object?> get props => [task, idTask, user];
}

class GetAllTasksEvent extends TaskEvent {
  const GetAllTasksEvent();
}

class AddTasksEvent extends TaskEvent {
  const AddTasksEvent(Task task) : super(task: task);
}

class FilterTaskEvent extends TaskEvent {
  const FilterTaskEvent();
}

class RemoveTasksEvent extends TaskEvent {
  const RemoveTasksEvent(String idTask) : super(idTask: idTask);
}

class UpdateTasksEvent extends TaskEvent {
  const UpdateTasksEvent(Task task) : super(task: task);
}

class ClearTokenEvent extends TaskEvent {
  const ClearTokenEvent();
}
