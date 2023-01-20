import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../utils/Assets.dart';
import '../../services/ColorService.dart';

typedef FunctionIntCallBack = void Function(int index);

class DesktopNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final FunctionIntCallBack onItemTapped;
  final int selectedIndex;
  final double headerMargins;

  DesktopNavigationBar(
      {Key? key,
      required this.onItemTapped,
      required this.selectedIndex,
      required this.headerMargins})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(92);

  static final colorService = Injector().get<ColorService>();

  double widthBetweenButtons = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 92,
      decoration: const BoxDecoration(color: Colors.white),
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
          const Spacer(),
          SizedBox(
            width: 200,
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    onPressed: () => onItemTapped(0),
                    icon: ImageIcon(
                      Image.asset(A.assetsFeedTabIcon).image,
                      color: selectedIndex == 0
                          ? colorService.primaryColor()
                          : colorService.bottomNavigationBarInactiveColor(),
                    ),
                  ),
                ),
                SizedBox(
                  width: widthBetweenButtons,
                ),
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    onPressed: () => onItemTapped(1),
                    icon: ImageIcon(
                      Image.asset(A.assetsMyTourTabIcon).image,
                      color: selectedIndex == 1
                          ? colorService.primaryColor()
                          : colorService.bottomNavigationBarInactiveColor(),
                    ),
                  ),
                ),
                SizedBox(
                  width: widthBetweenButtons,
                ),
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    onPressed: () => onItemTapped(2),
                    icon: ImageIcon(
                      Image.asset(A.assetsProfileTabIcon).image,
                      color: selectedIndex == 2
                          ? colorService.primaryColor()
                          : colorService.bottomNavigationBarInactiveColor(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: headerMargins,
          ),
        ],
      ),
    );
  }
}
