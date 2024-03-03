import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

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
