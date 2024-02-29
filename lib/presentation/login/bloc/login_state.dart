// part of 'login_bloc.dart';
//
// class LoginState extends Equatable {
//   final String? email;
//   final EmailError? emailError;
//   final String? password;
//   final PasswordError? passwordError;
//   final bool? emailValid;
//   final bool? passwordValid;
//   final bool? authenticated;
//
//   final User? token;
//
//   const LoginState({
//     this.token,
//     required this.email,
//     required this.emailError,
//     required this.password,
//     // required this.passwordError,
//     required this.emailValid,
//     required this.passwordValid,
//     required this.authenticated,
//   });
//
//   bool get allFieldsValid => emailValid! && passwordValid!;
//
//   factory LoginState.initial() => const LoginState(
//     token: const Uuid().v1(),
//         email: '',
//         emailError: EmailError.noError,
//         password: '',
//         passwordError: PasswordError.noError,
//         emailValid: false,
//         passwordValid: false,
//         authenticated: false,
//       );
//
//   LoginState copyWith({
//     final String? email,
//     final EmailError? emailError,
//     final String? password,
//     final PasswordError? passwordError,
//     final bool? emailValid,
//     final bool? passwordValid,
//     final bool? authenticated,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       emailError: emailError ?? this.emailError,
//       password: password ?? this.password,
//       passwordError: passwordError ?? this.passwordError,
//       emailValid: emailValid ?? this.emailValid,
//       passwordValid: passwordValid ?? this.passwordValid,
//       authenticated: authenticated ?? this.authenticated,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         email,
//         emailError,
//         password,
//         passwordError,
//         emailValid,
//         passwordValid,
//         authenticated,
//       ];
// }

part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final User? user;
  final String? email;
  final bool? emailValid;

  const LoginState({this.email, this.emailValid, this.user});

  @override
  List<Object> get props => [
        user!,
        email!,
        emailValid!,
      ];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginDoneState extends LoginState {
  const LoginDoneState(User user) : super(user: user);
}
