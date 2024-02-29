import 'package:taskmaster/data/datasources/authenticationl_datasoursce.dart';
import 'package:taskmaster/domain/entities/user.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthenticationDataSource authenticationDataSource;

  UserRepositoryImpl(this.authenticationDataSource);

  @override
  Future<void> addUser(User user) async {
    final userModel = UserModel.fromEntity(user);
    authenticationDataSource.addUser(userModel);
  }

  @override
  Future<void> deleteToken(String token) async {
    authenticationDataSource.deleteToken(token);
  }

  @override
  Future<User> getToken() async {
    return authenticationDataSource.getToken().toEntity();
  }
}
