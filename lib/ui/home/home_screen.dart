import 'package:cubit_bloc/ui/counter_page/counter_page.dart';
import 'package:cubit_bloc/ui/user_page/user_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CounterPage();
              }));
            }, child: Text("Counter Screen")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return UserPage();
              }));
            }, child: Text("User Screen"))
          ],
        ),
      ),
    );
  }
}
