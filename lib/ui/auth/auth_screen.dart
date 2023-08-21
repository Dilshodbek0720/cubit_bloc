import 'package:cubit_bloc/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/cubits/auth/auth_state.dart';
import 'package:cubit_bloc/cubits/navbar/navbar_cubit.dart';
import 'package:cubit_bloc/cubits/navbar/navbar_state.dart';
import 'package:cubit_bloc/ui/auth/login/login_screen.dart';
import 'package:cubit_bloc/ui/auth/sign/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<Widget> pages = [];

  @override
  void initState() {
    pages.add(SignUpScreen());
    pages.add(LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state){
            if(state is SignUpState) {
              return pages[0];
            } else if(state is SignInState) {
              return pages[1];
            } else{
              return Scaffold(
                appBar: AppBar(
                  title: Text("Error"),
                ),
              );
            }
          },
        ),
    );
  }
}
