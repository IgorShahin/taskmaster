import '../entities/user.dart';

abstract class UserRepository {
  Future<void> addUser(User user);

  Future<User> getToken();

  Future<void> deleteToken(String token);
}
