import '../entities/user.dart';

abstract class UserRepository {
  Future<void> addToken(User user);

  Future<User> getUser();

  Future<void> clearToken(User user);
}
