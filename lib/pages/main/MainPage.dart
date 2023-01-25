import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet/pages/main/profile/ProfilePage.dart';
import '../../services/ColorService.dart';
import '../../ui/navigation_bar/DesktopNavigationBar.dart';
import '../../ui/navigation_bar/MobileNavigationBar.dart';
import '../../utils/Routes.dart';
import '../../utils/ScreenSize.dart';
import 'details/DetailsPage.dart';
import 'events/EventsPage.dart';
import 'feed/FeedPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final colorService = Injector().get<ColorService>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        switch (index) {
          case 0:
            navigatorKey.currentState?.pushNamed(Routes.feedPage);
            break;
          case 1:
            navigatorKey.currentState?.pushNamed(Routes.eventsPage);
            break;
          case 2:
            navigatorKey.currentState?.pushNamed(Routes.profilePage);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (MediaQuery.of(context).size.width < WidthFormFactor.tablet)
            ? null
            : DesktopNavigationBar(
                onItemTapped: _onItemTapped,
                selectedIndex: _selectedIndex,
                headerMargins: MediaQuery.of(context).size.width * 0.05),
        body: Navigator(
          key: navigatorKey,
          initialRoute: Routes.feedPage,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case Routes.feedPage:
                builder = (BuildContext context) => FeedPage();
                break;
              case Routes.eventsPage:
                builder = (BuildContext context) => EventsPage();
                break;
              case Routes.profilePage:
                builder = (BuildContext context) => ProfilePage();
                break;
              default:
                builder = (BuildContext context) => FeedPage();
                break;
            }
            return MaterialPageRoute(
              builder: builder,
              settings: settings,
            );
          },
        ),
        bottomNavigationBar:
            (MediaQuery.of(context).size.width < WidthFormFactor.tablet)
                ? MobileBottomNavigationWidget(
                    selectedIndex: _selectedIndex,
                    onItemTapped: _onItemTapped,
                  )
                : null,
      ),
    );
  }
}
