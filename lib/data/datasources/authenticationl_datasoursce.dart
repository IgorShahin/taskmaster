import 'package:hive/hive.dart';

import '../model/user_model.dart';

class AuthenticationDataSource {
  final Box<UserModel> authenticationBox;

  AuthenticationDataSource(this.authenticationBox);

  void addUser(UserModel user) {
    authenticationBox.put(user.token, user);
  }

  UserModel getToken() {
    return authenticationBox.values.first;
  }

  void deleteToken(String token) {
    authenticationBox.delete(token);
  }
}
