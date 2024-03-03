part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class SuccessfulLoginState extends HomeState {
  const SuccessfulLoginState();
}

class UnsuccessfulLoginState extends HomeState {
  const UnsuccessfulLoginState();
}


