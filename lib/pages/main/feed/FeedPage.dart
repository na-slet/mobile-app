import 'package:flutter/material.dart';

import '../../../utils/ScreenSize.dart';
import 'FeedPageDesktop.dart';
import 'FeedPageMobile.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
        return FeedPageMobile();
      } else {
        return FeedPageDesktop();
      }
    });
  }
}
