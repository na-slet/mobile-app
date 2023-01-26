import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:naslet/pages/main/profile/ProfilePage.dart';

import '../../services/AuthService.dart';
import '../../services/ColorService.dart';
import '../../ui/navigation_bar/DesktopNavigationBar.dart';
import '../../ui/navigation_bar/MobileNavigationBar.dart';
import '../../utils/Routes.dart';
import '../../utils/ScreenSize.dart';
import 'events/EventsPage.dart';
import 'feed/FeedPage.dart';
import 'profile/bloc/profile_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final colorService = Injector().get<ColorService>();
  final authService = Injector().get<AuthService>();

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
    return BlocProvider(
      create: (context) => ProfileBloc(authService: authService),
      child: SafeArea(
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
              Widget route;
              switch (settings.name) {
                case Routes.feedPage:
                  route = FeedPage();
                  break;
                case Routes.eventsPage:
                  route = EventsPage();
                  break;
                case Routes.profilePage:
                  route = ProfilePage();
                  break;
                default:
                  route = FeedPage();
                  break;
              }
              return PageRouteBuilder(
                pageBuilder: (_, __, ___) => route,
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
      ),
    );
  }
}
