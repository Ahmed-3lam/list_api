part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeSuccessState extends HomeState {
  final List<UserModel> userList;


  const HomeSuccessState({
    required this.userList,

  });

  @override
  List<Object> get props => [userList];
}
class HomeErrorState extends HomeState {
  @override
  List<Object> get props => [];
}
