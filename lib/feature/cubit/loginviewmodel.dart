import 'package:approval/feature/cubit/loginstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class Loginviewmodel extends Cubit<LoginStates>{
  var loginusecase;
  Loginviewmodel({required this.loginusecase}) : super(LogininitalState());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formkey = GlobalKey<FormState>();
  void login() async{
    if(formkey.currentState?.validate() == true){
      emit(LoginLoadingState());
      var either = await loginusecase.invoke( email.text, password.text);
    }}
}