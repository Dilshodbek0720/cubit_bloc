import 'package:cubit_bloc/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/cubits/auth/auth_state.dart';
import 'package:cubit_bloc/ui/auth/auth_screen.dart';
import 'package:cubit_bloc/ui/tabbox/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/global_button.dart';
import '../widgets/global_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F9).withOpacity(0.92),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state){
          return ListView(
            children: [
              const SizedBox(height: 55,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text("Create\nNew Account", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: Color(0xFF01AA4F)
                ),),
              ),
              const SizedBox(height: 40,),
              const SizedBox(height: 40,),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text("Sign Up", style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF666666)
                ),),
              ),
              SizedBox(height: 40,),
              GlobalTextField(hintext: "Enter your email", controller: context.read<AuthCubit>().emailController,),
              SizedBox(height: 20,),
              GlobalTextField(hintext: "Enter your password", controller: context.read<AuthCubit>().passwordController,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 28),
                child: GlobalButton(onTap: ()async{
                  await context.read<AuthCubit>().signUp(context);
                  print(context.read<AuthCubit>().isSign);
                  if(context.read<AuthCubit>().isSign){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return TabBox();
                    }));
                  }
                }, borderColor: Color(0xFF01AA4F), color: Color(0xFF01AA4F), textColor: Colors.white, text: "Sign Up"),
              ),
              SizedBox(height: 12,),
              SizedBox(height: 10,),
              GlobalButton(onTap: (){
                context.read<AuthCubit>().clear();
                context.read<AuthCubit>().changeState(1);
                print(context.read<AuthCubit>().state);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return AuthScreen();
                }));
              }, borderColor: Color(0xFF999999).withOpacity(0.2), color: Color(0xFFF5F7F9).withOpacity(0.62), textColor: Colors.black.withOpacity(0.4), text: "Login")
            ],
          );
        },
      )
    );
  }
}