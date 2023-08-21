import 'package:cubit_bloc/cubits/navbar/navbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarCubit extends Cubit<NavbarState>{
  NavbarCubit() : super(HomeState());

  void changeState(int index){
    switch(index){
      case 0: emit(HomeState()); break;
      case 1: emit(CategoryState()); break;
      case 2: emit(CartState()); break;
      case 3: emit(ProfileState()); break;
    }
  }
}