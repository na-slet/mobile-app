import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../../services/AuthService.dart';
import '../../../utils/ScreenSize.dart';
import 'ProfilePageDesktop.dart';
import 'ProfilePageMobile.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  final authService = Injector().get<AuthService>();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(authService: authService),
      child: LayoutBuilder(builder: (context, constraints) {
        context.read<ProfileBloc>().add(ProfileLoadUser());
        if (MediaQuery.of(context).size.width < WidthFormFactor.tablet) {
          return ProfilePageMobile();
        } else {
          return ProfilePageDesktop();
        }
      }),
    );
  }
}
