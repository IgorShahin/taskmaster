import 'package:taskmaster/core/usecase.dart';

import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UcAddTask extends UseCase<void, Task> {
  final TaskRepository _taskRepository;

  UcAddTask(this._taskRepository);

  @override
  Future<void> call({Task? params}) {
    return _taskRepository.addTask(params!);
  }
}
