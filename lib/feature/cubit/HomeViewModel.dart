import 'package:approval/feature/Hometabs/notify.dart';
import 'package:approval/feature/Hometabs/order_status.dart';
import 'package:approval/feature/Hometabs/orders.dart';
import 'package:approval/feature/cubit/homeScreenState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewmodel extends Cubit<HomeStates>{
  HomeViewmodel() : super(HomeintialState());
  List<Widget> bodylist = [
    Notify(),
    Orders() ,
    OrderStatus(),

  ];

  int selectedindex = 0;
  void Buttonontap(int index) {
    selectedindex = index;
    emit(ChangeSelectedIndex());
  }
}