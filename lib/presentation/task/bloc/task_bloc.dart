import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/task.dart';
import '../../../domain/usecase/uc_add_task.dart';
import '../../../domain/usecase/uc_delete_task.dart';
import '../../../domain/usecase/uc_get_all_tasks.dart';
import '../../../domain/usecase/uc_update_task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final UcGetAllTask _ucGetAllTask;
  final UcAddTask _ucAddTask;
  final UcDeleteTask _ucDeleteTask;
  final UcUpdateTask _ucUpdateTask;

  TaskBloc(
    this._ucGetAllTask,
    this._ucAddTask,
    this._ucDeleteTask,
    this._ucUpdateTask,
  ) : super(const TaskLoadingState()) {
    on<GetAllTasksEvent>(onGetAllTasks);
    on<AddTasksEvent>(onAddTasks);
    on<RemoveTasksEvent>(onRemoveTasks);
    on<UpdateTasksEvent>(onUpdateTasks);
    on<FilterTaskEvent>(onFilterTasks);
  }

  void onGetAllTasks(GetAllTasksEvent event, Emitter<TaskState> emit) async {
    final tasks = await _ucGetAllTask();
    emit(TaskDoneState(tasks));
  }

  void onAddTasks(AddTasksEvent addTask, Emitter<TaskState> emit) async {
    await _ucAddTask(params: addTask.task);
    final tasks = await _ucGetAllTask();
    emit(TaskDoneState(tasks));
  }

  void onRemoveTasks(
      RemoveTasksEvent removeTask, Emitter<TaskState> emit) async {
    await _ucDeleteTask(params: removeTask.idTask);
    final tasks = await _ucGetAllTask();
    emit(TaskDoneState(tasks));
  }

  void onUpdateTasks(UpdateTasksEvent task, Emitter<TaskState> emit) async {
    await _ucUpdateTask(params: task.task);
    final tasks = await _ucGetAllTask();
    emit(TaskDoneState(tasks));
  }

  void onFilterTasks(FilterTaskEvent task, Emitter<TaskState> emit) async {
    final tasks = await _ucGetAllTask();
    emit(TaskDoneState(
        tasks.where((task) => task.isCompleted == true).toList()));
  }
}
