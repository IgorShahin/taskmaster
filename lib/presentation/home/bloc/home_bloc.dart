import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecase/uc_get_user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UcGetUser _ucGetToken;

  HomeBloc(this._ucGetToken) : super(const HomeLoadingState()) {
    on<GetTokenEvent>(onGetToken);
  }

  void onGetToken(GetTokenEvent event, Emitter<HomeState> emit) async {
    final user = await _ucGetToken();
    if (user.token!.isNotEmpty) {
      emit(const SuccessfulLoginState());
    } else {
      emit(const UnsuccessfulLoginState());
    }
  }
}
