import 'package:taskmaster/core/usecase.dart';

import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UcGetAllTask extends UseCase<List<Task>, void> {
  final TaskRepository _taskRepository;

  UcGetAllTask(this._taskRepository);

  @override
  Future<List<Task>> call({void params}) {
    return _taskRepository.getAllTasks();
  }
}
