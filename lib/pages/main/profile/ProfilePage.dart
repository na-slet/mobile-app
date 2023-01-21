import 'package:flutter/material.dart';

import '../../../utils/ScreenSize.dart';
import 'ProfilePageDesktop.dart';
import 'ProfilePageMobile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
        return ProfilePageMobile();
      } else {
        return ProfilePageDesktop();
      }
    });
  }
}
