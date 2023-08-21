import 'package:cubit_bloc/ui/auth/sign/sign_screen.dart';
import 'package:cubit_bloc/ui/counter_page/counter_page.dart';
import 'package:cubit_bloc/ui/power_page/power_page.dart';
import 'package:cubit_bloc/ui/tabbox/tab_box.dart';
import 'package:cubit_bloc/ui/user_page/user_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CounterPage();
              }));
            }, child: const Text("Counter Screen", style: TextStyle(fontSize: 25),)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const UserPage();
              }));
            }, child: const Text("User Screen", style: TextStyle(fontSize: 25),)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const PowerPage();
              }));
            }, child: const Text("Power Screen", style: TextStyle(fontSize: 25),)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TabBox();
              }));
            }, child: const Text("TabBox Screen", style: TextStyle(fontSize: 25),)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SignUpScreen();
              }));
            }, child: const Text("SignUp Screen", style: TextStyle(fontSize: 25),))
          ],
        ),
      ),
    );
  }
}
