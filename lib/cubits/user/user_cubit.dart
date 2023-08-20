import 'package:cubit_bloc/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserModel>{
  UserCubit(): super(
    UserModel()
  );

  updateUserName(String newName){
    emit(state.copyWith(userName: newName));
  }

  updateUserAge(int newAge){
    emit(state.copyWith(userAge: newAge));
  }
}