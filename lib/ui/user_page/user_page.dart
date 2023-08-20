import 'package:cubit_bloc/cubits/user/user_cubit.dart';
import 'package:cubit_bloc/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: BlocBuilder<UserCubit, UserModel>(
        builder: (context, state){
          return Padding(padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Username"
                    ),
                    onChanged: (v){
                      context.read<UserCubit>().updateUserName(v);
                    },
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "UserAge"
                    ),
                    onChanged: (v){
                      if(v.isNotEmpty){
                        context.read<UserCubit>().updateUserAge(int.parse(v));
                      }
                    },
                  ),
                  Text("User Data:\n${state.toString()}",style: TextStyle(
                    fontSize: 25
                  ),)
                ],
              ),
            ),
          );
        },
        buildWhen: (previous, current){
          return previous!=current;
        },
      )
    );
  }
}
