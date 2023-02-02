import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../models/Event.dart';
import '../../../models/EventState.dart';
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
        create: (context) => DetailBloc(
            authService: authService,
            eventId: event.id,
            eventState: event.state ?? EventState.notParticipated),
        child: BlocConsumer<DetailBloc, DetailState>(
          listener: (context, state) {
            if (state is DetailSuccess) {
              _showSnackBar(context: context, text: state.message);
            } else if (state is DetailError) {
              _showSnackBar(context: context, text: state.message);
            }
          },
          builder: (context, state) {
            return MediaQuery.of(context).size.width < WidthFormFactor.tablet
                ? DetailsPageMobile(
                    event: event,
                    state: state,
                  )
                : DetailsPageDesktop(
                    event: event,
                    state: state,
                  );
          },
        ));
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
