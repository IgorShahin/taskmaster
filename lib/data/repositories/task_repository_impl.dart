import 'package:taskmaster/data/datasources/task_datasource.dart';
import 'package:taskmaster/data/model/task_model.dart';
import 'package:taskmaster/domain/entities/task.dart';

import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    localDataSource.addTask(taskModel);
  }

  @override
  Future<void> deleteTask(String id) async {
    localDataSource.deleteTask(id);
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final taskModels = localDataSource.getAllTasks();
    List<Task> res = taskModels.map((model) => model.toEntity()).toList();
    return res;
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskModel = TaskModel.fromEntity(task);
    localDataSource.updateTask(taskModel);
  }
}
