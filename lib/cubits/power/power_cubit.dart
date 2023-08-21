
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class PowerCubit extends Cubit<num>{
  PowerCubit() : super(0);

  num powNumber = 0;
  num number1 = 0;
  num number2 = 0;

  void power(){
    powNumber = pow(number1, number2);
    emit(pow(number1, number2));
  }
}