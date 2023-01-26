import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/Routes.dart';
import '../../../utils/ScreenSize.dart';
import 'ProfilePageDesktop.dart';
import 'ProfilePageMobile.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is ProfileLogoutState) {
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(Routes.signInPage, (route) => false);
      }
    }, builder: (context, state) {
      if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
        return ProfilePageMobile(
          state: state,
        );
      } else {
        return ProfilePageDesktop(
          state: state,
        );
      }
    });
  }
}
