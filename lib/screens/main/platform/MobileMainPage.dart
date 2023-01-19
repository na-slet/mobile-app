import 'package:flutter/material.dart';

import '../../../ui/navigation_bar/MobileNavigationBar.dart';





class MobileMainPage extends StatefulWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

class _MobileMainPageState extends State<MobileMainPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
          () {
        _selectedIndex = index;
        switch (index) {
          case 0:
            print('0');
            break;
          case 1:
            print('1');
            break;
          case 2:
            print('2');
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MobileBottomNavigationWidget(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          height: 70,
        ),
        body: Container(),
      ),
    );
  }
}