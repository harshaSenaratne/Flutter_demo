
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class FetchUserData extends HomeEvent {}

