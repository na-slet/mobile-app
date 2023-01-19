import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../utils/Assets.dart';
import '../../services/ColorService.dart';

class DesktopNavigationBar extends StatefulWidget {
  final int selectedIndex;

  const DesktopNavigationBar({required this.selectedIndex, Key? key})
      : super(key: key);

  @override
  State<DesktopNavigationBar> createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<DesktopNavigationBar> {
  static final colorService = Injector().get<ColorService>();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;
    return SizedBox(
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
