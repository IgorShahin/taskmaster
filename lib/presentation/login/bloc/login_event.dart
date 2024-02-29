part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  final User? user;
  const LoginEvent({this.user});
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class AddUserEvent extends LoginEvent {
  const AddUserEvent(User user);

  List<Object?> get props => throw UnimplementedError();
}

class GetTokenEvent extends LoginEvent {
  const GetTokenEvent();

  List<Object?> get props => throw UnimplementedError();
}

class LoginLoginButtonClicked extends LoginEvent {
  const LoginLoginButtonClicked();

  @override
  List<Object?> get props => [];
}

class LoginRequestErrorShowed extends LoginEvent {
  const LoginRequestErrorShowed();

  @override
  List<Object?> get props => [];
}
