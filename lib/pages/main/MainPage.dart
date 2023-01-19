import 'package:flutter/material.dart';

import '../../utils/ScreenSize.dart';
import 'platform/DesktopMainPage.dart';
import 'platform/MobileMainPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.of(context).size.width < WidthFormFactor.tablet + 100) {
          return MobileMainPage();
        } else {
          return DesktopMainPage();
        }
      }),
    );
  }
}
