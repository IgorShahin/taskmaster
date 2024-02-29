import 'package:taskmaster/core/usecase.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class UcGetToken extends UseCase<User, void> {
  final UserRepository _userRepository;

  UcGetToken(this._userRepository);

  @override
  Future<User> call({void params}) {
    return _userRepository.getToken();
  }
}
