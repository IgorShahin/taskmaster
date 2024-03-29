import 'package:taskmaster/core/usecase.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class UcAddToken extends UseCase<void, User> {
  final UserRepository _userRepository;

  UcAddToken(this._userRepository);

  @override
  Future<void> call({User? params}) => _userRepository.addToken(params!);
}
