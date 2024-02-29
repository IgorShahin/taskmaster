import 'package:taskmaster/core/usecase.dart';

import '../repositories/task_repository.dart';

class UcDeleteTask extends UseCase<void, String> {
  final TaskRepository _taskRepository;

  UcDeleteTask(this._taskRepository);

  @override
  Future<void> call({String? params}) {
    return _taskRepository.deleteTask(params!);
  }
}
