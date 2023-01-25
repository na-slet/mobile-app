import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Event.dart';
import '../../../utils/ScreenSize.dart';
import 'DetailsPageDesktop.dart';
import 'DetailsPageMobile.dart';
import 'bloc/detail_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Event event;

  const DetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
            return DetailsPageMobile(
              event: event,
            );
          } else {
            return DetailsPageDesktop(
              event: event,
            );
          }
        },
      ),
    );
  }
}
