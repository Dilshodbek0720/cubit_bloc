import 'package:cubit_bloc/cubits/navbar/navbar_cubit.dart';
import 'package:cubit_bloc/cubits/navbar/navbar_state.dart';
import 'package:cubit_bloc/ui/home/home_screen.dart';
import 'package:cubit_bloc/ui/tabbox/widgets/cart.dart';
import 'package:cubit_bloc/ui/tabbox/widgets/category.dart';
import 'package:cubit_bloc/ui/tabbox/widgets/home.dart';
import 'package:cubit_bloc/ui/tabbox/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBox extends StatefulWidget {
  TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(HomePage());
    screens.add(CategoryPage());
    screens.add(CartPage());
    screens.add(ProfilePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state){
          if(state is HomeState) {
            return screens[0];
          } else if(state is CategoryState) {
            return screens[1];
          } else if(state is CartState) {
            return screens[2];
          } else {
            return screens[3];
          }
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.deepPurple
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
          onTap: (v){
            context.read<NavbarCubit>().changeState(v);
          },
        ),
      )
    );
  }
}
