import 'package:hive/hive.dart';
import 'package:taskmaster/data/model/task_model.dart';

class TaskDataSource {
  final Box<TaskModel> taskBox;

  TaskDataSource(this.taskBox);

  void addTask(TaskModel task) {
    taskBox.put(task.id, task);
  }

  List<TaskModel> getAllTasks() {
    return taskBox.values.toList();
  }

  void deleteTask(String id) {
    taskBox.delete(id);
  }

  void updateTask(TaskModel task) {
    taskBox.put(task.id, task);
  }
}
