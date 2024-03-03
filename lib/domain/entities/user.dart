import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? token;

  const User({this.token});

  User copyWith({
    String? token,
  }) {
    return User(
      token: token,
    );
  }

  @override
  List<Object?> get props => [token];
}
