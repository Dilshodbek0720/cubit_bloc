import 'package:cubit_bloc/cubits/counter/counter_cubit.dart';
import 'package:cubit_bloc/cubits/user/user_cubit.dart';
import 'package:cubit_bloc/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CounterCubit(),),
      BlocProvider(create: (_) => UserCubit(),),
    ], child: MainApp());
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
