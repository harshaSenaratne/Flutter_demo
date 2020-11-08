part of 'home_bloc.dart';
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}
class UserDataInitial extends HomeState {}

class UserDataInProgress extends HomeState {}

class UserDataComplete extends HomeState {
  final List<UserModel> userdata;

  UserDataComplete({this.userdata});
}

class UserDataError extends HomeState {
  final String error;

  const UserDataError({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Oops!! Something went wrong { error: $error }';
}