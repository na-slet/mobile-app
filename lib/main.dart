import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'utils/ModuleContainer.dart';
import 'utils/Routes.dart';
import 'generated/l10n.dart';
import 'pages/auth/SignInPage.dart';
import 'pages/auth/SignUpPage.dart';

import 'screens/main/MainPage.dart';
import 'services/FontService.dart';

void main() {
  ModuleContainer.initialize(Injector());
  runApp(NaSletApp());
}

class NaSletApp extends StatelessWidget {
  final fontService = Injector().get<FontService>();
  NaSletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'na-slet',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: fontService.Inter),
      initialRoute: Routes.mainPage,
      routes: {
        Routes.signInPage: (context) => SignInPage(),
        Routes.signUpPage: (context) => SignUpPage(),
        Routes.mainPage: (context) => MainPage(),
      },
    );
  }
}
