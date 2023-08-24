part of 'users_cubit.dart';

@immutable
abstract class UsersState extends Equatable{}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoadingState extends UsersState{
  @override
  List<Object?> get props => [];
}

class UsersSuccessState extends UsersState{
  UsersSuccessState({required this.usersModel});
  List<UsersModel> usersModel;
  @override
  List<Object?> get props => [usersModel];
}

class UsersErrorState extends UsersState{
  final String errorText;
  UsersErrorState({required this.errorText});
  @override
  List<Object?> get props => [errorText];
}