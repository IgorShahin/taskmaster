import 'package:taskmaster/core/usecase.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class UcAddUser extends UseCase<void, User> {
  final UserRepository _userRepository;

  UcAddUser(this._userRepository);

  @override
  Future<void> call({User? params}) async {
    return _userRepository.addUser(params!);
  }
}
