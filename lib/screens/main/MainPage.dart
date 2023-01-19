import 'package:flutter/material.dart';
import 'package:naslet_mobile/common_setup/ScreenSize.dart';

import '../../common_setup/Routes.dart';
import '../../ui/NavigationBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.of(context).size.width < FormFactor.tablet + 100) {
          return MobileMainPage();
        } else {
          return DesktopMainPage();
        }
      }),
    );
  }
}

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



class DesktopMainPage extends StatelessWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: DesktopNavigationBar(),
        body: Container(),
      ),
    );
  }
}
