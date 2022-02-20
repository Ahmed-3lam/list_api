import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:list_api/dependencies/dependency_init.dart';
import 'package:list_api/model/UserModel.dart';

import '../../repository/repository_impl.dart';
import '../../utils/log_utils.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final RepositoryImpl _apiBaseHelper = getIt<RepositoryImpl>();

  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await _apiBaseHelper.getUsers().then((response) {
      try {
        List data = response.data;
        List<UserModel> usersList = [];
        for (var user in data) {
          usersList.add(UserModel.fromJson(user));
        }
        emit(HomeSuccessState(userList: usersList));
      } on TimeoutException {
        emit(HomeErrorState());
        Log.i(response.message ?? "TimeOut");
      } on SocketException {
        emit(HomeErrorState());
        Log.i(response.message ?? "Error");
      } catch (err) {
        Log.i(err.toString());
        emit(HomeErrorState());
      }
    });

    // if (response.status != Status.COMPLETED) {
    //   emit(HomeErrorState());
    //   Log.i(response.message??"error");
    // } else {
    //   List data = response.data;
    //   for (var user in data) {
    //     usersList.add(UserModel.fromJson(user));
    //   }
    //   emit(HomeSuccessState());
    // }
  }
}
