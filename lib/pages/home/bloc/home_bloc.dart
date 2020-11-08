import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/pages/home/model/user_model.dart';
import 'package:flutter_demo/pages/home/repository/user_repository.dart';
part 'home_events.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(UserDataInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchUserData) {
      yield* _mapListViewDataLoadedToState();
    }
  }

  Stream<HomeState> _mapListViewDataLoadedToState() async* {
    yield UserDataInProgress();
      UserRepository userRepo = UserRepository();
    List<UserModel> userList = await userRepo.getRecords();

    if (userList != null) {
      yield UserDataComplete(userdata: userList);
    } else {
      yield UserDataError(error: "user data fetch failed");
    }
  }
}