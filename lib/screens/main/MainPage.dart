import 'package:flutter/material.dart';
import 'package:naslet_mobile/common_setup/ScreenSize.dart';

import '../../common_setup/Routes.dart';
import 'platform/DesktopMainPage.dart';
import 'platform/MobileMainPage.dart';


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
