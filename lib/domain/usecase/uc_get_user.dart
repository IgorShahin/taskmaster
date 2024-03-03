import 'package:taskmaster/core/usecase.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class UcGetUser extends UseCase<User, void> {
  final UserRepository _userRepository;

  UcGetUser(this._userRepository);

  @override
  Future<User> call({void params}) => _userRepository.getUser();
}
