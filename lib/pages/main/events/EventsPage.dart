import 'package:flutter/material.dart';

import '../../../utils/ScreenSize.dart';
import 'EventsPageDesktop.dart';
import 'EventsPageMobile.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
          return EventsPageMobile();
        } else {
          return EventsPageDesktop();
        }
      },
    );
  }
}
