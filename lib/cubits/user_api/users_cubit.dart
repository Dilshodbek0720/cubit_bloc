import 'package:bloc/bloc.dart';
import 'package:cubit_bloc/data/models/users_model.dart';
import 'package:cubit_bloc/data/network/api_service/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/universal_data.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({required this.apiService}) : super(UsersInitial());

  final ApiService apiService;

  Future<void> getAllUsers() async{
    emit(UsersLoadingState());
    UniversalData universalData = await apiService.getAllUsers();
    if(universalData.error.isEmpty){
      emit(UsersSuccessState(usersModel: universalData.data as List<UsersModel>));
    }else{
      emit(UsersErrorState(errorText: universalData.error));
    }
  }
}
