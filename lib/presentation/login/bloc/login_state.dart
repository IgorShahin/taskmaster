part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final User user;
  final EmailError emailError;
  final String password;
  final PasswordError passwordError;
  final bool emailValid;
  final bool passwordValid;
  final bool authenticated;

  const LoginState({
    required this.email,
    required this.emailError,
    required this.password,
    required this.passwordError,
    required this.emailValid,
    required this.passwordValid,
    required this.authenticated,
    required this.user,
  });

  bool get allFieldsValid => emailValid && passwordValid;

  factory LoginState.initial() => const LoginState(
      email: '',
      emailError: EmailError.noError,
      password: '',
      passwordError: PasswordError.noError,
      emailValid: false,
      passwordValid: false,
      authenticated: false,
      user: User());

  LoginState copyWith({
    final String? email,
    final EmailError? emailError,
    final String? password,
    final PasswordError? passwordError,
    final bool? emailValid,
    final bool? passwordValid,
    final bool? authenticated,
    final User? user,
  }) {
    return LoginState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      emailValid: emailValid ?? this.emailValid,
      passwordValid: passwordValid ?? this.passwordValid,
      authenticated: authenticated ?? this.authenticated,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        email,
        emailError,
        password,
        passwordError,
        emailValid,
        passwordValid,
        authenticated,
      ];
}
