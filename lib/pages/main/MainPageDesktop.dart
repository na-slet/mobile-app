import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../utils/Assets.dart';
import '../../../services/ColorService.dart';
import '../../../ui/navigation_bar/DesktopNavigationBar.dart';

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({Key? key}) : super(key: key);

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
  final colorService = Injector().get<ColorService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorService.desktopBackground(),
        body: Column(
          children: <Widget>[
            desktopHeader(context),
          ],
        ),
      ),
    );
  }
}

Widget desktopHeader(BuildContext context) {
  final colorService = Injector().get<ColorService>();

  double headerMargins = MediaQuery.of(context).size.width * 0.05;

  int _selectedIndex = 0;

  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: 92,
    decoration: BoxDecoration(color: Colors.white),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: headerMargins,
        ),
        SizedBox(
          width: 148,
          height: 50,
          child: Image.asset(A.assetsLogoDesktopClient),
        ),
        Spacer(),
        DesktopNavigationBar(
          selectedIndex: _selectedIndex,
        ),
        SizedBox(
          width: headerMargins,
        ),
      ],
    ),
  );
}
