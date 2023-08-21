import 'package:cubit_bloc/cubits/auth/auth_cubit.dart';
import 'package:cubit_bloc/cubits/counter/counter_cubit.dart';
import 'package:cubit_bloc/cubits/navbar/navbar_cubit.dart';
import 'package:cubit_bloc/cubits/power/power_cubit.dart';
import 'package:cubit_bloc/cubits/user/user_cubit.dart';
import 'package:cubit_bloc/ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/network/firebase/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CounterCubit(),),
      BlocProvider(create: (_) => UserCubit(),),
      BlocProvider(create: (_) => PowerCubit()),
      BlocProvider(create: (_) => NavbarCubit()),
      BlocProvider(create: (_) => AuthCubit(firebaseServices: AuthService()))
    ], child: MainApp());
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          color: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500
          )
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
