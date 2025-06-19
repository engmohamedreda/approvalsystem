import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feature/Expenses/view/expense_request_page.dart';
import '../feature/Expenses/view/expenses/expenses_wizard_page.dart';
import '../feature/Home/HomeScreen.dart';
import '../feature/Hometabs/notify.dart';
import '../feature/Hometabs/order_status.dart';
import '../feature/Hometabs/orders.dart';
import '../feature/Login/login.dart';
import '../feature/SplachScreen/splachScreen.dart';
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return  login();
          },
        ),
        GoRoute(
          path: 'Home',
          builder: (BuildContext context, GoRouterState state) {
            return  Homescreen();
          },
        ),
        GoRoute(
          path: 'Notify',
          builder: (BuildContext context, GoRouterState state) {
            return  Notify();
          },
        ),

        GoRoute(
          path: 'OrderStatus',
          builder: (BuildContext context, GoRouterState state) {
            return  OrderStatus();
          },
        ),
        GoRoute(
          path: 'Orders',
          builder: (BuildContext context, GoRouterState state) {
            return  Orders();
          },
        ),
        GoRoute(
          path: 'Orders',
          builder: (BuildContext context, GoRouterState state) {
            return  Orders();
          },
        ),
        GoRoute(
          path: 'ExpensesWizardPage',
          builder: (BuildContext context, GoRouterState state) {
            return  ExpensesWizardPage();
          },
        ),
        GoRoute(
          path: 'ExpenseRequestPage',
          builder: (BuildContext context, GoRouterState state) {
            return  ExpenseRequestPage();
          },
        ),
      ],
    ),
  ],
);