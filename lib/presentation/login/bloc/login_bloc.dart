import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:taskmaster/domain/entities/user.dart';
import 'package:taskmaster/domain/usecase/uc_add_user.dart';
import 'package:taskmaster/domain/usecase/uc_delete_token.dart';
import 'package:taskmaster/domain/usecase/uc_get_token.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UcGetToken _ucGetToken;
  final UcAddUser _ucAddUser;
  final UcDeleteToken _ucDeleteToken;

  LoginBloc(
    this._ucGetToken,
    this._ucAddUser,
    this._ucDeleteToken,
  ) : super(const LoginLoadingState()) {
    on<AddUserEvent>(onAddToken);
    on<GetTokenEvent>(onGetToken);
  }

  void onAddToken(AddUserEvent addUser, Emitter<LoginState> emit) async {
    await _ucAddUser(params: addUser.user);
  }

  void onGetToken(GetTokenEvent addUser, Emitter<LoginState> emit) async {
    final token = await _ucGetToken();
    emit(state);
  }

  _emailValid(final String email) {
    return EmailValidator.validate(email);
  }

//
  FutureOr<void> _emailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final newEmail = event.email;
    final emailValid = _emailValid(newEmail);
  }

  _passwordValid(final String password) {
    return password.length >= 6;
  }
}
