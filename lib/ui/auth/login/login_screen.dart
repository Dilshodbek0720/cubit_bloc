import 'package:cubit_bloc/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/ui/auth/sign/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabbox/tab_box.dart';
import '../widgets/global_button.dart';
import '../widgets/global_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F9).withOpacity(0.92),
      body: ListView(
        children: [
          const SizedBox(height: 55,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text("Welcome\nBack", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                color: Color(0xFF01AA4F)
            ),),
          ),
          const SizedBox(height: 40,),
          const SizedBox(height: 40,),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Login", style: TextStyle(
                fontSize: 25,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                color: Color(0xFF666666)
            ),),
          ),
          const SizedBox(height: 40,),
          GlobalTextField(hintext: "Enter your email", controller: context.read<AuthCubit>().emailController,),
          const SizedBox(height: 20,),
          GlobalTextField(hintext: "Enter your password", controller: context.read<AuthCubit>().passwordController,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: GlobalButton(onTap: (){
              context.read<AuthCubit>().loginUser(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return TabBox();
              }));
            }, borderColor: Color(0xFF01AA4F), color: Color(0xFF01AA4F), textColor: Colors.white, text: "Login"),
          ),
          const SizedBox(height: 30,),
          Column(children: [
            const Text("Forgot password", style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF999999),
                fontFamily: "Roboto"
            ),),
            Container(height: 1,width: 125,color: Color(0xFF999999),)
          ],),
          const SizedBox(height: 20,),
          GlobalButton(onTap: (){
            context.read<AuthCubit>().clear();
            context.read<AuthCubit>().changeState(0);
          }, borderColor: Color(0xFF999999).withOpacity(0.2), color: Color(0xFFF5F7F9).withOpacity(0.62), textColor: Colors.black.withOpacity(0.4), text: "Sign Up")
        ],
      ),
    );
  }
}