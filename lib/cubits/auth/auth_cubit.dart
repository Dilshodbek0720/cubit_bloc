import 'package:cubit_bloc/cubits/auth/auth_state.dart';
import 'package:cubit_bloc/data/universal_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/network/firebase/auth_service.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit({required this.firebaseServices}) : super(SignUpState());

  final AuthService firebaseServices;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isSign = false;

  Future<void> signUp(BuildContext context) async{
    String email = emailController.text;
    String password = passwordController.text;
    notify(true);
    UniversalData universalData = await firebaseServices.signUpUser(email: email, password: password);
    notify(false);

    if(universalData.error.isEmpty){
      if(context.mounted){
        isSign = true;
        showMessage(context, "User signed Up");
        emit(state);
      }
    }else{
      if(context.mounted){
        showMessage(context, universalData.error);
      }
    }
  }

  Future<void> loginUser(BuildContext context) async{
    String email = emailController.text;
    String password = passwordController.text;
    notify(true);
    UniversalData universalData = await firebaseServices.loginUser(email: email, password: password);
    notify(false);

    if(universalData.error.isEmpty){
      if(context.mounted){
        isSign = true;
        showMessage(context, "Login Up");
        emit(state);
      }
    }else{
      if(context.mounted){
        showMessage(context, universalData.error);
      }
    }
  }

  clear(){
    emailController.clear();
    passwordController.clear();
  }

  notify(bool value) {
    isLoading = value;
    emit(state);
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    emit(state);
  }

  void changeState(int index){
    switch(index){
      case 0: emit(SignUpState()); break;
      case 1: emit(SignInState()); break;
      // case 2: emit(CartState()); break;
      // case 3: emit(ProfileState()); break;
    }
  }

}