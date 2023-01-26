import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../services/AuthService.dart';
import '../../../utils/ScreenSize.dart';
import 'EventsPageDesktop.dart';
import 'EventsPageMobile.dart';
import 'bloc/events_bloc.dart';

class EventsPage extends StatelessWidget {
  final authService = Injector().get<AuthService>();

  EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EventsBloc(authService: authService),
        child: (MediaQuery.of(context).size.width < WidthFormFactor.tablet)
            ? EventsPageMobile()
            : EventsPageDesktop());
  }
}
