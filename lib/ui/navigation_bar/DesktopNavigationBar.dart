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

  double widthBetweenButtons = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
            },
            icon: ImageIcon(
              Image.asset(A.assetsFeedTabIcon).image,
              color: widget.selectedIndex == 0
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ),
          ),
          SizedBox(
            width: widthBetweenButtons,
          ),
          IconButton(
            onPressed: () {
            },
            icon: ImageIcon(
              Image.asset(A.assetsMyTourTabIcon).image,
              color: widget.selectedIndex == 1
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ),
          ),
          SizedBox(
            width: widthBetweenButtons,
          ),
          IconButton(
            onPressed: () {
            },
            icon: ImageIcon(
              Image.asset(A.assetsProfileTabIcon).image,
              color: widget.selectedIndex == 2
                  ? colorService.primaryColor()
                  : colorService.bottomNavigationBarInactiveColor(),
            ),
          ),
        ],
      ),
    );
  }
}
