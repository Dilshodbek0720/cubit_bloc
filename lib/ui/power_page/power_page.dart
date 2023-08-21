import 'package:cubit_bloc/cubits/power/power_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PowerPage extends StatelessWidget {
  const PowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Power Screen"),
        ),
        body: BlocBuilder<PowerCubit, num>(
          builder: (context, state){
            return Container(
              padding: EdgeInsets.all(16),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 50,),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Number 1"
                      ),
                      onChanged: (v){
                        context.read<PowerCubit>().number1 = num.parse(v);
                        context.read<PowerCubit>().power();
                      },
                    ),
                    const SizedBox(height: 50,),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Number 2"
                      ),
                      onChanged: (v){
                        if(v.isNotEmpty){
                          context.read<PowerCubit>().number2 = num.parse(v);
                          context.read<PowerCubit>().power();
                        }
                      },
                    ),
                    const SizedBox(height: 50,),
                    Text("Result: $state",style: const TextStyle(
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
