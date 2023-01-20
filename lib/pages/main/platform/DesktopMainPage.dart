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
        body: Column(
          children: <Widget>[
            DesktopHeader(context),
          ],
        ),
      ),
    );
  }
}

Widget DesktopHeader(BuildContext context) {
  final colorService = Injector().get<ColorService>();

  int _selectedIndex = 0;

  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: 92,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: colorService.primaryColor(),
          width: 2,
        ),
      ),
    ),
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
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
          width: MediaQuery.of(context).size.width * 0.2,
        ),
      ],
    ),
  );
}
