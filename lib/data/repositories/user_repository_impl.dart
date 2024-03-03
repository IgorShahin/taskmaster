import 'package:taskmaster/data/datasources/authenticationl_datasoursce.dart';
import 'package:taskmaster/domain/entities/user.dart';
import 'package:taskmaster/domain/repositories/user_repository.dart';

import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthenticationDataSource authenticationDataSource;

  UserRepositoryImpl(this.authenticationDataSource);

  @override
  Future<void> addToken(User user) async {
    final userModel = UserModel.fromEntity(user);
    authenticationDataSource.addToken(userModel);
  }

  @override
  Future<void> clearToken(User user) async {
    final userModel = UserModel.fromEntity(user);
    authenticationDataSource.clearToken(userModel);
  }

  @override
  Future<User> getUser() async {
    return authenticationDataSource.getUser().toEntity();
  }
}
