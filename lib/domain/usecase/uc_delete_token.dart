import 'package:taskmaster/core/usecase.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

class UcDeleteToken extends UseCase<void, String> {
  final UserRepository _userRepository;

  UcDeleteToken(this._userRepository);

  @override
  Future<void> call({String? params}) {
    return _userRepository.deleteToken(params!);
  }
}
