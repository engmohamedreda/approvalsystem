import 'package:approval/feature/cubit/HomeViewModel.dart';
import 'package:approval/feature/cubit/homeScreenState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = '/Homescreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HomeViewmodel viewmodel = HomeViewmodel();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeViewmodel, HomeStates>(
      bloc: viewmodel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: viewmodel.bodylist[viewmodel.selectedindex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: viewmodel.selectedindex,
              onTap: viewmodel.Buttonontap,
              iconSize: 24,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
              items: [
                _bottomNavigationBarItem(
                  context,
                  isselected: viewmodel.selectedindex == 0,
                  Selectedicon: Icon(Icons.notifications),
                  unselectedicon: Icon(Icons.notifications),
                  label: 'الإشعارات',
                ),
                _bottomNavigationBarItem(
                  context,
                  isselected: viewmodel.selectedindex == 1,
                  Selectedicon: Icon(Icons.add_box_outlined),
                  unselectedicon: Icon(Icons.add_box_outlined),
                  label: 'الطلبات',
                ),
                _bottomNavigationBarItem(
                  context,
                  isselected: viewmodel.selectedindex == 2,
                  Selectedicon: Icon(Icons.save),
                  unselectedicon: Icon(Icons.save),
                  label: 'حالة الطلب',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      BuildContext context, {
        required bool isselected,
        required Icon Selectedicon,
        required Icon unselectedicon,
        required String label,
      }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor: isselected
            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
        radius: 25,
        child: Icon(
          isselected ? Selectedicon.icon : unselectedicon.icon,
          color: isselected
              ? Colors.blue
              : Theme.of(context).unselectedWidgetColor,
          size: 28,
        ),
      ),
      label: label,
    );
  }
}
