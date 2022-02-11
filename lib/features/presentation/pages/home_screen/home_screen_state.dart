part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}


class HomeScreenLoadingState extends HomeScreenState {
  @override
  List<Object> get props => [];
}


class HomeScreenErrorState extends HomeScreenState {
  final String message;

  HomeScreenErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class HomeScreenLoadedState extends HomeScreenState {
  final UserModelEntity? userModelEntity;
  HomeScreenLoadedState({required this.userModelEntity});

  @override
  List<Object> get props => [];
}