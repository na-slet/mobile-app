import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../common_setup/Assets.dart';
import '../../services/ColorService.dart';
import 'MobileNavigationBar.dart';

class DesktopNavigationBar extends StatefulWidget {

  const DesktopNavigationBar({Key? key}) : super(key: key);

  @override
  State<DesktopNavigationBar> createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<DesktopNavigationBar> {
  static final colorService = Injector().get<ColorService>();

  final _inactiveColor = colorService.bottomNavigationBarInactiveColor();

  // final FunctionIntCallBack onItemTapped;
  int selectedIndex ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              selectedIndex = 0;
            },
            icon: ImageIcon(Image.asset(
              A.assetsFeedTabIcon,
              color: selectedIndex == 0
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ).image),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              selectedIndex = 1;

            },
            icon: ImageIcon(Image.asset(
              A.assetsBookmarkTabIcon,
              color: selectedIndex == 1
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ).image),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              selectedIndex = 2;
            },
            icon: ImageIcon(Image.asset(
              A.assetsProfileTabIcon,
              color: selectedIndex == 2
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ).image),
          ),
        ],
      ),
    );
  }
}
