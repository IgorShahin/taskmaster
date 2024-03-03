import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:taskmaster/domain/usecase/uc_add_user.dart';
import 'package:taskmaster/domain/usecase/uc_get_user.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/enum/enum.dart';
import '../../../domain/entities/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UcAddToken _ucAddToken;
  final UcGetUser _ucGetUser;

  LoginBloc(
    this._ucAddToken,
    this._ucGetUser,
  ) : super(LoginState.initial()) {
    on<LoginLoginButtonClicked>(_loginButtonClicked);
    on<LoginEmailChanged>(_emailChanged);
    on<LoginPasswordChanged>(_passwordChanged);
  }

  FutureOr<void> _loginButtonClicked(
    LoginLoginButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    if (state.allFieldsValid) {
      final token = await _ucGetUser();
      await _ucAddToken(params: token.copyWith(token: const Uuid().v1()));
      emit(state.copyWith(authenticated: true));
    }
  }

  FutureOr<void> _emailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final newEmail = event.email;
    final emailValid = _emailValid(newEmail);
    emit(
      state.copyWith(
        email: newEmail,
        emailValid: emailValid,
        emailError: EmailError.noError,
        authenticated: false,
      ),
    );
  }

  bool _emailValid(final String email) {
    return EmailValidator.validate(email);
  }

  FutureOr<void> _passwordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final newPassword = event.password;
    final passwordValid = newPassword.length >= 8;
    emit(state.copyWith(
      password: newPassword,
      passwordValid: passwordValid,
      passwordError: PasswordError.noError,
      authenticated: false,
    ));
  }
}

enum LoginError { emailNotExist, wrongPassword }
