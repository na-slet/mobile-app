import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../common_setup/Assets.dart';
import '../generated/l10n.dart';
import '../services/ColorService.dart';
import '../services/GradientService.dart';

typedef FunctionIntCallBack = void Function(int index);

class MobileBottomNavigationWidget extends StatelessWidget {

  static final colorService = Injector().get<ColorService>();
  final FunctionIntCallBack onItemTapped;
  final int selectedIndex;

  static final TextStyle _lableStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: colorService.bottomNavigationBarInactiveColor(),
  );

  const MobileBottomNavigationWidget({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  // dst dstATop hue
  @override
  Widget build(BuildContext context) {
    return GradinetLeftToRight(
      borderRadius: BorderRadius.zero,
      blendMode: BlendMode.hue,
      tileMode: TileMode.clamp,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colorService.primaryColor(),
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
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 5,
                  ),
                  child: ImageIcon(Image.asset(A.assetsFeedTabIcon).image),
                ),
                label: S.current.navBarFeedTabTitleText,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 5,
                    ),
                    child: ImageIcon(Image.asset(A.assetsMyTourTabIcon).image)),
                label: S.current.navBarMyTourTabTitleText,
              ),
              BottomNavigationBarItem(
                icon: Container(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 5,
                    ),
                    child: ImageIcon(Image.asset(A.assetsProfileTabIcon).image)),
                label: S.current.navBarProfileTabTitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopNavigationBar extends StatelessWidget {
  const DesktopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
