import 'package:flutter/material.dart';
import 'package:naslet_mobile/pages/main/feed/FeedPageDesktop.dart';
import 'package:naslet_mobile/pages/main/feed/FeedPageMobile.dart';

import '../../../utils/ScreenSize.dart';

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
