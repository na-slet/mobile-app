import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../models/Event.dart';
import '../../../services/AuthService.dart';
import '../../../utils/ScreenSize.dart';
import 'DetailsPageDesktop.dart';
import 'DetailsPageMobile.dart';
import 'bloc/detail_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Event event;
  final authService = Injector().get<AuthService>();

  DetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            DetailBloc(authService: authService, eventId: event.id),
        child: (MediaQuery.of(context).size.width < WidthFormFactor.tablet)
            ? DetailsPageMobile(
                event: event,
              )
            : DetailsPageDesktop(
                event: event,
              ));
  }
}
