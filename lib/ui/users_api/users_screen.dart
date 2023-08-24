import 'package:cubit_bloc/cubits/user_api/users_cubit.dart';
import 'package:cubit_bloc/data/models/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  @override
  void initState() {
    context.read<UsersCubit>().getAllUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      body: BlocConsumer<UsersCubit, UsersState>(
        builder: (context, state){
          if(state is UsersSuccessState){
            return ListView(
              children: [
                ...List.generate(state.usersModel.length, (index) {
                  UsersModel user = state.usersModel[index];
                  return Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.deepPurpleAccent.withOpacity(0.1)
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Image.network(user.avatar_url, fit: BoxFit.cover,),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                          Text(user.username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7)),),
                          Text("City: ${user.state}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.8)),)
                        ],)
                      ],
                    )
                  );
                })
              ],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
        listener: (context, state){
          if(state is UsersLoadingState){
            const Center(child: CircularProgressIndicator(),);
          }
          if(state is UsersErrorState){
            return showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }

  void showErrorMessage({
    required String message,
    required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Error",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            message,
            style:
            const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF273032)),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            isDefaultAction: true,
            child: const Text("ok"),
          )
        ],
      ),
    );
  }
}
