import 'package:hive/hive.dart';

import '../model/user_model.dart';

class AuthenticationDataSource {
  final Box<UserModel> authenticationBox;

  AuthenticationDataSource(this.authenticationBox);

  void addToken(UserModel user) {
    authenticationBox.putAt(0, user);
  }

  UserModel getUser() {
    return authenticationBox.values.first;
  }

  void clearToken(UserModel user) {
    authenticationBox.putAt(0, user);
  }
}
