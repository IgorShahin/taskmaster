import 'package:taskmaster/core/usecase.dart';

import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UcUpdateTask extends UseCase<void, Task> {
  final TaskRepository _taskRepository;

  UcUpdateTask(this._taskRepository);

  @override
  Future<void> call({Task? params}) {
    return _taskRepository.updateTask(params!);
  }
}
