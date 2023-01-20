import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../utils/Assets.dart';
import '../../generated/l10n.dart';
import '../../services/ColorService.dart';

typedef FunctionIntCallBack = void Function(int index);

class MobileBottomNavigationWidget extends StatelessWidget {
  static final colorService = Injector().get<ColorService>();

  final FunctionIntCallBack onItemTapped;
  final int selectedIndex;
  final double height;

  const MobileBottomNavigationWidget({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
    required this.height,
  }) : super(key: key);

  static final TextStyle _lableStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: colorService.bottomNavigationBarInactiveColor(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: colorService.primaryGradient(),
        border: const Border(
          top: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colorService.primaryColor(),
          unselectedItemColor: colorService.bottomNavigationBarInactiveColor(),
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
          selectedLabelStyle: _lableStyle,
          unselectedLabelStyle: _lableStyle,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                width: 23,
                height: 20,
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 4,
                ),
                child: ImageIcon(Image.asset(A.assetsFeedTabIcon).image),
              ),
              label: S.current.navBarFeedTabTitleText,
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 24,
                  height: 18,
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 4,
                  ),
                  child: ImageIcon(Image.asset(A.assetsMyTourTabIcon).image)),
              label: S.current.navBarMyTourTabTitleText,
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 18,
                  height: 20,
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 4,
                  ),
                  child: ImageIcon(Image.asset(A.assetsProfileTabIcon).image)),
              label: S.current.navBarProfileTabTitleText,
            ),
          ],
        ),
      ),
    );
  }
}
