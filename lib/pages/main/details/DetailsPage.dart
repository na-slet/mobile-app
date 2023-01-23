import 'package:flutter/material.dart';

import '../../../utils/ScreenSize.dart';
import 'DetailsPageDesktop.dart';
import 'DetailsPageMobile.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
          return DetailsPageMobile();
        } else {
          return DetailsPageDesktop();
        }
      },
    );
  }
}
